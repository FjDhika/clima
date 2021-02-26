class Weather {
  String cityName;
  double temperature;
  int condition;

  Weather({this.cityName, this.condition, this.temperature});

  Weather.fromJson(Map<String, dynamic> json)
      : cityName = json['name'],
        temperature = json['main']['temp'].toDouble(),
        condition = json['weather'][0]['id'];

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temperature > 34) {
      return 'Time for shorts and 👕';
    } else if (temperature > 24) {
      return 'Bring a 🧥 just in case';
    } else {
      return 'You\'ll need 🧣 and 🧤';
    }
  }
}
