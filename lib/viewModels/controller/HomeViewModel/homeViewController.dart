import 'package:get/get.dart';
import 'package:weather_app/Models/weatherModel.dart';
import '../../../data/repository/HomeViewRepo.dart';
import '../../../data/status.dart';

class HomeViewController extends GetxController {
  final _api = HomeViewRepo();

  final rxRequestStatus = Status.LOADING.obs;
  final weathermodel = WeatherModel().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setCurrentWeather(WeatherModel value) => weathermodel.value = value;

  void getCurrentWeather() {
    _api.weatherApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setCurrentWeather(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
