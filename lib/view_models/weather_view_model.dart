import 'package:clima/models/weather.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utils/api_utils.dart';

class WeatherViewModel {
  Future<Weather> getData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url = getCurrentWeatherApiUrl(location.lat, location.lng);
    NetworkHelper weatherNetwork = NetworkHelper(url: url);

    var weatherJson = await weatherNetwork.getData();
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getDataByCity(String city) async {
    String url = getWeatherByCityUrl(city);
    NetworkHelper weatherNetwork = NetworkHelper(url: url);

    var weatherJson = await weatherNetwork.getData();
    return Weather.fromJson(weatherJson);
  }
}
