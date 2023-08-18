import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors/AppColors.dart';

class MinMaxRow extends StatelessWidget {
  String max, min;
  MinMaxRow({super.key, required this.max, required this.min});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Max Temp',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontSize: 14,
                color: AppColor.subheadingColor,
                fontWeight: FontWeight.w600,
              )),
            ),
            Text(max),
          ],
        ),
        const VerticalDivider(
          thickness: 7.0,
          width: 20,
          endIndent: 25,
          indent: 25,
          color: Colors.black,
        ),
        Column(
          children: [
            Text(
              'Min temp',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontSize: 14,
                color: AppColor.subheadingColor,
                fontWeight: FontWeight.w600,
              )),
            ),
            Text(min),
          ],
        ),
      ],
    );
  }
}
