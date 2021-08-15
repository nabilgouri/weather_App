import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.URL);

  final String URL;

  Future getData() async {
    var url = Uri.parse(URL);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(URL);

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
