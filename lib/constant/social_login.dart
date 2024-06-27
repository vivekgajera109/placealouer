// function to implement the google signin

// creating firebase instance
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:placealouer/utils/network/repo.dart';

late final FirebaseAuth? auth;

Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // if (result != null) {
    var res = ApiRepo.socialLogin(
      {"social_token": authCredential.accessToken},
    );

    log("----->>> ${res.hashCode}");
    // Navigator.pushReplacement(
    // context, MaterialPageRoute(builder: (context) => HomePage()));
  } // if result not null we simply call the MaterialpageRoute,
  // for go to the HomePage screen
}
