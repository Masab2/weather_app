// ignore_for_file: file_names, non_constant_identifier_names

import 'package:intl/intl.dart';

class Utils {
  static double kelvin_to_clecius(var kelvinvalue) {
    return kelvinvalue - 275.15;
  }

  // Get Modified Time
  static String dateFormated(var unixTimestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return DateFormat('h:mm:ss a').format(dateTime).toString();
  }

  // Convert the pressure vaue bar to
  static double PressureConvertions(var value) {
    return value * 29.53;
  }
}
