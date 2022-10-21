import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  print("llega a local");
  return await Geolocator.getCurrentPosition();
}

double calculateDistance(
    Map<String, dynamic> position1, Map<String, dynamic> position2) {
  return Geolocator.distanceBetween(position1["latitude"],
      position1["longitude"], position2["latitude"], position2["longitude"]);
}
