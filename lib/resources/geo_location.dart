import 'package:geolocator/geolocator.dart';

class GeoLocation {
  double longitude = 0;
  double latitude = 0;
  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    longitude = position.latitude;
    latitude = position.longitude;
  }
}
