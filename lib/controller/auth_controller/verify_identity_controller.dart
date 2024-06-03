import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:placealouer/utils/process_indicator.dart';
import 'package:placealouer/view/main_home/main_home.dart';

class VerifyIdentityController extends GetxController {
  Rx<Uint8List> selectedFileRecto = Uint8List(0).obs;
  Rx<Uint8List> selectedFileVerso = Uint8List(0).obs;
  // Rx<Uint8List> uploadImageUrl = Uint8List(0).obs;
  RxList<FileRequestBody> files = <FileRequestBody>[].obs;
  Future<void> pickFileRecto() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true, withReadStream: true);
    if (result != null) {
      selectedFileRecto.value =
          await File(result.files.single.path!).readAsBytes();

      // selectedFileRecto.value = File(result.files.single.path!);
      files.add(
          FileRequestBody(name: "Recto Image", file: selectedFileRecto.value));
      log("=====>> ${files.length}");
      log("=====>> ${selectedFileRecto.value}");
      selectedFileRecto.refresh();
    } else {
      // User canceled the picker
    }
    update();
    // notifyListeners();
  }

  Future<void> pickFileVerso() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true, withReadStream: true);
    if (result != null) {
      selectedFileVerso.value =
          await File(result.files.single.path!).readAsBytes();
      files.add(
          FileRequestBody(name: "Verso Image", file: selectedFileVerso.value));
      log("=====>> ${files.length}");
      selectedFileVerso.refresh();
    } else {
      // User canceled the picker
    }
    update();
    // notifyListeners();
  }

  Future<bool> uplodImage(BuildContext context) async {
    // String name = selectedFileRecto.value.path.split('/').last.toString();
    await ApiRepo.uploadImage(files).then(
      (value) async {
        if (value.code == 200) {
          log("=====>> ${value.data["data"]["imageUrls"]}");
          Circle().show(context);
          addIdentity((value.data["data"]["imageUrls"] as List)
              .map((e) => e.toString())
              .toList());
          Circle().hide(context);
          log("=====>> ${value.data["data"]["imageUrls"]}");
        }
        // Circle().hide(context);
      },
    );
    return true;
  }

  Future<bool> addIdentity(List<String> image) async {
    log("=====>> $image");
    // String name = selectedFileRecto.value.path.split('/').last.toString();
    await ApiRepo.addIdentity({"imgUrl": image}).then(
      (value) async {
        if (value.code == 200) {
          log("=====>> ${value.data["data"]["imageUrls"]}");
          Get.offAll(() => const MainHome());
        }
        // Circle().hide(context);
      },
    );
    return true;
  }
}

class FileRequestBody {
  final String name;
  final Uint8List file;

  FileRequestBody({required this.name, required this.file});
}
