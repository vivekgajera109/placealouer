import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:placealouer/constant/social_login.dart';
import 'package:placealouer/firebase_options.dart';
import 'package:placealouer/utils/network/network.dart';
import 'app.dart';

final box = GetStorage();
Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instance;
  if (box.read('token') != null) {
    NetworkDio.setHeaders({'authorization': 'Bearer ${box.read('token')}'});
  }
  log("--> ${box.read('token')}");

  runApp(const MyApp());
}
