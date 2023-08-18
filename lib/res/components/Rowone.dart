import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowOne extends StatelessWidget {
  String value1, value2, value3, text1, text2, text3;
  RowOne(
      {super.key,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
              text1,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(value1),
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
              text2,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(value2),
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
              text3,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(value3),
          ],
        ),
        const VerticalDivider(
          thickness: 7.0,
          width: 20,
          endIndent: 25,
          indent: 25,
          color: Colors.black,
        ),
      ],
    );
  }
}
