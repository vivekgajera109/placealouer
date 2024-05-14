import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/view/splash_screen/splash_screen.dart';

final GlobalKey<ScaffoldMessengerState> globalScaffoldKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Placealouer',
      scaffoldMessengerKey: globalScaffoldKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appWhiteColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
