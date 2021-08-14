import 'package:clima/screens/location_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/utilities/constants.dart';
import 'dart:convert';
import 'package:clima/services/networking.dart';
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
    Location l = Location();
    await l.getCurrentLocation();
    latitude = l.latitude.toString();
    longitude = l.longitude.toString();
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kAPI&units=metric');
    print(
        'api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kAPI');
    var weatherData = await network.get_data();
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
