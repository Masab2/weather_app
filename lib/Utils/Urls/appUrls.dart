// ignore_for_file: file_names

class AppUrls {
  static const String lat = '31.5204';
  static const String lon = '74.3587';
  static const String appId = 'ffcdbd264af16132c239ec67c98a1b87';

  // static String baseUrl(lat, lon) {
  //   return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appId&units=standard';
  // }

  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appId&units=standard';

  // Base url for Icon
  static const String icon = "https://openweathermap.org/img/wn/10d@2x.png";

  // Icon for the Weather
  static String buildUrlIcon(String icon) {
    return "https://openweathermap.org/img/wn/${icon}@2x.png";
  }
}
