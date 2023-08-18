import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Utils/Colors/AppColors.dart';
import 'package:weather_app/Utils/assets/image_asset.dart';
import 'package:weather_app/res/routes/routes_names.dart';
import 'package:weather_app/view/HomeScreen/HomeView.dart';

import '../../viewModels/Splash_Services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();
  @override
  void initState() {
    //implement initState
    super.initState();
    services.homeView(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.headingColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              height: Get.height * 0.80,
              width: Get.width * 0.80,
              image: const AssetImage(
                ImageAsset.splashScreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
