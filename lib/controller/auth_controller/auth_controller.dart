import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/model/login_model.dart';
import 'package:placealouer/model/signup_model.dart';
import 'package:placealouer/utils/repository/network_repository.dart';
import 'package:placealouer/view/inscription/code/code_view.dart';
import 'package:placealouer/view/inscription/connexion/connexion_view.dart';
import 'package:placealouer/view/inscription/reinitialization/re_reinitialization_view.dart';
import 'package:placealouer/view/main_home/main_home.dart';

import '../../utils/common_methods.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future signUp(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "Password and confirm password does not match",
      );
    } else {
      SignupModel res = await networkRepository.userSignUp(
        context,
        {
          "firstName": firstNameController.text.trim(),
          "lastName": lastNameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": numberController.text.trim(),
          "password": passwordController.text.trim()
        },
      );
      if (res.statusCode == 200) {
        clear();
        Get.offAll(() => const ConnexionScreen());
      } else {
        CommonMethod().getXSnackBar("Error",
            res.error_description ?? "Something went wrong", redContainerColor);
      }
    }
  }

  Future login(BuildContext context) async {
    LoginModel res = await networkRepository.userLogin(
      context,
      {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      },
    );
    if (res.statusCode == 200) {
      box.write("token", res.data?.token);
      log("---=---->1 ${res.data?.token}");
      log("---=---->2 ${res.data}");
      log("---=---->3 ${box.read("token")}");
      CommonMethod().getXSnackBar(
          "Success", res.message ?? "Login successfully", greenContainerColor);
      clear();
      Get.offAll(() => const MainHome());
    } else {
      CommonMethod().getXSnackBar("Error",
          res.errorDescription ?? "Something went wrong", redContainerColor);
    }
  }

  Future forgotrPassword(BuildContext context) async {
    var res = await networkRepository.forgotrPassword(
      context,
      {
        "email": emailController.text.trim(),
      },
    );
    log("---->>> message ${res["statusCode"]}");
    if (res["statusCode"] == 200) {
      CommonMethod().getXSnackBar(
          "Success", "OTP send successfully", greenContainerColor);
      // clear();
      Get.to(() => const CodeSreen());
    } else {
      CommonMethod().getXSnackBar(
          "Error",
          "You have entered an invalid email or phone number!",
          redContainerColor);
    }
  }

  Future otpVerification(BuildContext context) async {
    log(emailController.text.trim());
    var res = await networkRepository.otpVerification(
      context,
      {
        "email": emailController.text.trim(),
        "forgotOtp": otpController.text.trim()
      },
    );
    if (res["statusCode"] == 200) {
      CommonMethod().getXSnackBar(
          "Success", "OTP send successfully", greenContainerColor);
      // clear();
      Get.offAll(() => const ReReinitializationScreen());
    } else {
      CommonMethod().getXSnackBar(
          "Error",
          "You have entered an invalid email or phone number!",
          redContainerColor);
    }
  }

  Future resetPassword(BuildContext context) async {
    log(emailController.text.trim());
    if (passwordController.text != confirmPasswordController.text) {
      CommonMethod().getXSnackBar("Error",
          "Password and confirm password does not match!", redContainerColor);
    } else {
      var res = await networkRepository.resetPassword(
        context,
        {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim()
        },
      );
      if (res["statusCode"] == 200) {
        CommonMethod().getXSnackBar(
            "Success", "OTP send successfully", greenContainerColor);
        clear();
        Get.offAll(() => const ConnexionScreen());
      } else {
        CommonMethod().getXSnackBar(
            "Error",
            "You have entered an invalid email or phone number!",
            redContainerColor);
      }
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    confirmPasswordController.clear();
  }
}
