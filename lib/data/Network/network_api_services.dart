// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:weather_app/data/Network/Base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic reponseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('No Internet');
    } on RequestTimeOutExceptions {
      throw RequestTimeOutExceptions('TimeOut');
    }
    return reponseJson;
  }

  // Handel the Api Reponse
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataExceptions(
            'Error While Fetching the data ${response.statusCode}');
      default:
        throw FetchDataExceptions('Error While Fetching the data');
    }
  }
}
