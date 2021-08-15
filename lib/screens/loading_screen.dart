import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String longitude;
  String latitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getWeatherLocation();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        size: 100.0,
        color: Colors.white,
        //duration: Duration(milliseconds: 13000),
      )),
    );
  }
}
