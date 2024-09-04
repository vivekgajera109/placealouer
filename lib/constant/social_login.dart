// function to implement the google signin

// creating firebase instance
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

late final FirebaseAuth? auth;

Future<void> signup(BuildContext context) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      log("Access Token: ${authCredential.accessToken}");
      log("ID Token: ${authCredential.token.toString()}");

      // Sign in to Firebase with the Google credential
      await FirebaseAuth.instance.signInWithCredential(authCredential);

      // Call your API with the social token
      var res = await ApiRepo.socialLogin(
        {"social_token": authCredential.accessToken},
      );

      log("API Response: ${res.hashCode}");

      // Navigate to the home page or handle the API response
      // Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  } catch (e) {
    log("Error during Google sign-in: $e");
    // Handle different types of errors here, like showing a snackbar or alert
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sign-in failed. Please try again.")),
    );
  }
}

Future<void> appleLogin(BuildContext context) async {
  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );

  // if (result != null) {
  var res = ApiRepo.socialLogin(
    {"social_token": credential.identityToken.toString()},
  );

  log("----->>> ${res.hashCode}");
  // Navigator.pushReplacement(
  // context, MaterialPageRoute(builder: (context) => HomePage()));
} // if result not null we simply call the MaterialpageRoute,
// for go to the HomePage screen

Future<void> facebbookSignin() async {
  try {
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      'email'
    ]); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      log('=======>  ${result.message}');
      final credential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      final user = await signinWithCredential(credential);
      log('=======>  ${user}');
      // if (user != null) {
      //   return AuthUser(
      //     email: user.email,
      //     profilePictureUrl: user.photoURL,
      //     uid: user.uid,
      //     userName: user.displayName,
      //   );
      // }
    } else {
      log('=======>  ${result.message}');
    }
  } on FirebaseAuthException catch (e) {
    // Identify the error code and set an appropriate error message
    log('e.code ====> ${e.code}');
    log('e.code ====> ${e.message}');
    log('e.code ====> ${e.stackTrace}');
    if (e.code == 'account-exists-with-different-credential') {}

    log(e.code);
    // Display the error message
  }
}

Future<User?> signinWithCredential(OAuthCredential credential) async {
  final user = await FirebaseAuth.instance.signInWithCredential(credential);
  if (user.user != null) {
    final ss = user.user;
    debugPrint(
      json.encode({
        'uid': ss?.uid,
        'userName': ss?.displayName,
        'email': ss?.email,
        'profilePictureURL': ss?.photoURL,
      }),
    );
    return user.user;
  }
  return null;
}
