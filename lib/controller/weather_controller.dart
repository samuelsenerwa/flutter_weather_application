import 'package:get/get.dart';
import 'package:flutter_application_weather/model/weather_model.dart';
import 'package:flutter_application_weather/service/base_service.dart';
import 'package:flutter_application_weather/utilities/snack_bar.dart';

class WeatherController extends GetxController {
  final weatherService = Get.put(WeatherService());

  Future<Weather> getWeatherData() async {
    var res;

    try {
      res = await weatherService.getWeather();
      if (res.statusCode != 200 || res.statusCode != 201) {
        return WeatherSnackBars.errorSnackBar(message: res.data['message']);
      } else {}
    } catch (e) {
      WeatherSnackBars.errorSnackBar(message: e.toString());
    }
    retrun Weather.fromJson(res.data);
  }
}
