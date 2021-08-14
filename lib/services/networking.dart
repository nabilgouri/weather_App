import 'package:flutter/foundation.dart';

import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/utilities/constants.dart';
import 'dart:convert';

class NetworkHelper {
  String URL;

  NetworkHelper(this.URL);

  Future get_data() async {
    var url = Uri.parse(URL);
    var response = await http.post(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Response status: ${response.statusCode}');
    }
  }
}
