import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/view/HomeScreen/HomeView.dart';

class SplashServices {
  void homeView(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
          (route) => false);
    });
  }
}
