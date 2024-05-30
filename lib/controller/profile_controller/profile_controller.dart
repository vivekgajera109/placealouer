// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/model/get_prosile_model.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:placealouer/utils/process_indicator.dart';

class ProfileController extends GetxController {
  Rx<ProfileUser> userData = ProfileUser().obs;
  Future<GetProfileData?> getProfile() async {
    var res = await ApiRepo.getProfile<GetProfileModel>();
    log("----------=-> ${res.data?.data?.user}");
    if (res.code == 200) {
      userData.value = res.data?.data?.user ?? ProfileUser();
    }
    // return null;
    if (res.code == 200) {
      return res.data?.data;
    } else {
      return res.data?.data;
    }
  }

  Future getRatingAndReview({String? vendorId}) async {
    var res = await ApiRepo.getRatingAndReview(vendorId!);
    log("----------=->getRatingAndReview ${res.data["data"]}");

    if (res.code == 200) {
      return res.data;
    } else {
      return res.data;
    }
  }

  Rx<File> selectedFile = File("").obs;
  Rx<Uint8List> uploadImageUrl = Uint8List(0).obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true, withReadStream: true);
    if (result != null) {
      uploadImageUrl.value =
          await File(result.files.single.path!).readAsBytes();

      selectedFile.value = File(result.files.single.path!);

      selectedFile.refresh();
      uploadImageUrl.refresh();
    } else {
      // User canceled the picker
    }
    update();
    // notifyListeners();
  }

  Future<bool> uplodImage(BuildContext context) async {
    String name = selectedFile.value.path.split('/').last.toString();
    await ApiRepo.uploadImage(selectedFile.value.readAsBytesSync(), name).then(
      (value) async {
        if (value.code == 200) {
          log("=====>> ${value.data["data"]["imageUrls"][0]}");
          updateProfile(context, value.data["data"]["imageUrls"][0]);
        }
        // Circle().hide(context);
      },
    );
    return true;
  }

  Future<bool> updateProfile(BuildContext context, String imageUrl) async {
    var res = await ApiRepo.updateProfile(
      {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "phone": numberController.text.trim(),
        "profile_img": imageUrl
      },
      context,
    );

    // return null;
    if (res.code == 200) {
      Circle().hide(context);
      getProfile();
      return true;
    } else {
      Circle().hide(context);
      return false;
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void setData({required ProfileUser userData}) {
    // getProfile();
    emailController.text = userData.email ?? "";
    numberController.text = userData.phone ?? "";
    firstNameController.text = userData.firstName ?? "";
    lastNameController.text = userData.lastName ?? "";
    // passwordController.text = userData.value.password ?? "";
  }

  // void clear() {
  //   emailController.clear();
  //   passwordController.clear();
  //   firstNameController.clear();
  //   lastNameController.clear();
  //   confirmPasswordController.clear();
  // }
  RxDouble rating = 0.0.obs;
  TextEditingController reviewController = TextEditingController();
  Future addRating(String vendorId) async {
    var res = await ApiRepo.addRating(
      {
        "vendorId": vendorId,
        "rating": rating.value,
        "review": reviewController.text
      },
    );

    if (res.code == 200) {
      // await getBookedParkings();
      Get.back();
    }
  }
}
