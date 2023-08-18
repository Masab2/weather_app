// ignore_for_file: file_names

import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Utils/Urls/AppUrls.dart';
import 'package:weather_app/data/Network/network_api_services.dart';

class HomeViewRepo {
  final _apiservice = NetworkApiServices();
  Future<WeatherModel> weatherApi() async {
    final response = await _apiservice.getApi(AppUrls.baseUrl);
    return WeatherModel.fromJson(response);
  }
}
