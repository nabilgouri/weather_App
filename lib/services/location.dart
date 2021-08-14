import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
//Location(_latitude,_longitude){
  //this._longitude=_longitude;
  //this._latitude=_latitude;
//};
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.altitude;
    longitude = position.longitude;
  }
}
