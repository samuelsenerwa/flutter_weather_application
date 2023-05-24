import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'base_service.dart';

class WeatherService {
  BaseService service = BaseService();
  static const String apiKey = "aad16d107512edccaa95fad0a827e83b"; //your Api key here

  Future<Response> getWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      double longitude = position.longitude;
      double latitude = position.latitude;
      Response response = await service.request(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric",
          method: "Get");
      print("_++++++++++++++++++${response.statusCode}");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}