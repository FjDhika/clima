import 'package:clima/utils/constants.dart';

String getCurrentWeatherApiUrl(double lat, double lng) {
  return kBaseUrlAPI + 'weather?lat=$lat&lon=$lng&appid=$kAPIKEY&units=metric';
}

String getWeatherByCityUrl(String city) {
  return kBaseUrlAPI + 'weather?q=$city&appid=$kAPIKEY&units=metric';
}
