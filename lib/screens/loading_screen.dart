import 'package:clima/models/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/view_models/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Weather weatherData = await WeatherViewModel().getData();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            weather: weatherData,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
