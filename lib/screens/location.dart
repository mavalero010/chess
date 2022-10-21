import 'package:flutter/material.dart';
import 'package:proyecto_ui/controllers/location_controller.dart';
import '../util/localizer.dart';
import 'package:geolocator/geolocator.dart';
import '../util/localizer.dart';
import 'package:get/get.dart';

class LocationApp extends StatelessWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationController controller = Get.find();
    return Column(children: [
      MaterialButton(onPressed: controller.updateLocation, color: Colors.amber),
      Text(controller.location.value)
    ]);
  }
}
