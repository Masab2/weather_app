import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors/AppColors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Settings',
          style: GoogleFonts.workSans(
              textStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
