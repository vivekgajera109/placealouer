import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:placealouer/utils/network/network.dart';
import 'app.dart';

final box = GetStorage();
Future<void> main() async {
  await GetStorage.init();
  NetworkDio.setHeaders({'authorization': 'Bearer ${box.read('token')}'});
  log("--> ${box.read('token')}");

  runApp(const MyApp());
}
