import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Utils/Colors/AppColors.dart';
import 'package:weather_app/view/Splash_Screen/Splash_screen.dart';

import 'res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Get.isDarkMode ? Colors.black45 : Colors.white),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
