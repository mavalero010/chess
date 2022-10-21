import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../util/localizer.dart';

class LocationController extends GetxController {
  var location = "".obs;

  void setLocation(String newLocation) {
    location = newLocation.obs;
  }

  Future<Map<String, dynamic>> updateLocation() async{
    Position location = await determinePosition();
    Map<String, dynamic> map = {'latitude': location.latitude, 'longitude': location.longitude};
    return Future.value(map);
  }
}
