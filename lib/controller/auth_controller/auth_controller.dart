import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/model/login_model.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:placealouer/view/main_home/main_home.dart';
import 'package:placealouer/view/verify_identity/verify_identity_screen.dart';

import '../../utils/common_methods.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<bool> signUp(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "Password and confirm password does not match",
      );
    } else {
      var res = await ApiRepo.signup(
        {
          "firstName": firstNameController.text.trim(),
          "lastName": lastNameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": numberController.text.trim(),
          "password": passwordController.text.trim()
        },
      );
      log("-------->> $res");

      if (res.code == 200) {
        // clear();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  Future<LoginData?> login() async {
    var res = await ApiRepo.login<LoginModel>(
      {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      },
    );
    log("---->>>> ${res.code}");
    if (res.code == 200) {
      box.write("token", res.data?.data?.token);
      log("---=---->1 ${res.data?.data?.token}");
      log("---=---->2 ${res.data}");
      log("---=---->3 ${box.read("token")}");
      // CommonMethod().getXSnackBar(
      //     "Success", res.message ?? "Login successfully", greenContainerColor);
      // clear();
      res.data?.data?.user?.uploadedIdentity == []
          ? Get.offAll(() => const VerifyIdentity())
          : Get.offAll(
              () => const MainHome(),
            );
      return res.data?.data;
    } else {
      return null;
    }
  }

  Future<bool> forgotrPassword(BuildContext context) async {
    var res = await ApiRepo.forgoetPassword(
      {
        "email": emailController.text.trim(),
      },
    );
    log("---->>> message ${res.code}");
    if (res.code == 200) {
      return true;
    } else {
      return false;
    }
    // if (res["statusCode"] == 200) {
    //   CommonMethod().getXSnackBar(
    //       "Success", "OTP send successfully", greenContainerColor);
    //   // clear();
    //   Get.to(() => const CodeSreen(
    //         inSingup: false,
    //       ));
    // } else {
    //   CommonMethod().getXSnackBar(
    //       "Error",
    //       "You have entered an invalid email or phone number!",
    //       redContainerColor);
    // }
  }

  Future<bool> forgotPassOtpVerification() async {
    var res = await ApiRepo.otpVerification(
      {
        "email": emailController.text.trim(),
        "forgotOtp": otpController.text.trim()
      },
    );
    if (res.code == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signupVerification() async {
    log(emailController.text.trim());
    log(otpController.text.trim());
    var res = await ApiRepo.signupVerification(
      {
        "email": emailController.text.trim(),
        "signupOtp": int.parse(otpController.text.trim())
      },
    );
    log("-=----->> ${res.code}");
    if (res.code == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword() async {
    log(emailController.text.trim());
    if (passwordController.text != confirmPasswordController.text) {
      CommonMethod().getXSnackBar("Error",
          "Password and confirm password does not match!", redContainerColor);
    } else {
      var res = await ApiRepo.resetPassword(
        {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim()
        },
      );
      log("-=----->> ${res.code}");
      if (res.code == 200) {
        return true;
      } else {
        return false;
      }
      // if (res["statusCode"] == 200) {
      //   CommonMethod().getXSnackBar(
      //       "Success", "OTP send successfully", greenContainerColor);
      //   clear();
      //   Get.offAll(() => const ConnexionScreen());
      // } else {
      //   CommonMethod().getXSnackBar(
      //       "Error",
      //       "You have entered an invalid email or phone number!",
      //       redContainerColor);
      // }
    }
    return true;
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    confirmPasswordController.clear();
  }
}
// } 
