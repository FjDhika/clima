import 'package:clima/models/weather.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/view_models/weather_view_model.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  // final String cityName, message, weatherIcon;
  // final int temperature;
  final Weather weather;
  LocationScreen({this.weather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName, message, weatherIcon;
  int temperature;

  void updateUi({Weather weatherData}) {
    setState(() {
      if (weatherData == null) {
        cityName = '';
        message = 'cant get data';
        temperature = 0;
        weatherIcon = '';
        return;
      }
      cityName = weatherData.cityName;
      message = weatherData.getMessage();
      temperature = weatherData.temperature.toInt();
      weatherIcon = weatherData.getWeatherIcon();
    });
  }

  @override
  void initState() {
    super.initState();
    updateUi(weatherData: widget.weather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () async {
                      Weather weatherData = await WeatherViewModel().getData();
                      updateUi(weatherData: weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 45.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ));
                      if (result != null) {
                        var weather =
                            await WeatherViewModel().getDataByCity(result);
                        updateUi(weatherData: weather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 45,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Text(
                  '$message in $cityName',
                  style: kMessageTextStyle,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
