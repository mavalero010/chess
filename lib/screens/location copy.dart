import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/controllers/location_controller.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  
  LocationController locationController = Get.find();
  FirebaseController firebaseController = Get.find();
  AuthenticationController authenticationController = Get.find();

  Set<Marker> markers = {};

  static const CameraPosition initialCamera = CameraPosition(
      target: LatLng(11.019050494351221, -74.85115074272943),
      zoom: 16);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialCamera,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getLocations,
        label: Text('Obtener Ubicaciones'),
        icon: Icon(Icons.navigation_rounded)
      ),
    );
  }

  Future<void> getLocations() async {
    final GoogleMapController controller = await _controller.future;
    
    //My Position

    Map<String ,dynamic> myPosition = await locationController.updateLocation();

    final CameraPosition myPositionCamera = CameraPosition(
      target: LatLng(myPosition['latitude'], myPosition['longitude']),
      zoom: 16);

    Marker myPositionMarker = Marker(
      markerId: MarkerId(authenticationController.getCurrentUserId()),
      position: LatLng(myPosition['latitude'], myPosition['longitude']),
      //infoWindow: InfoWindow(title: authenticationController.userName),
      infoWindow: const InfoWindow(title: "Yo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
    );
    
    controller.animateCamera(CameraUpdate.newCameraPosition(myPositionCamera));

    setState(() {
        markers.add(myPositionMarker);
      });

    //Others Positions
    List<Map<String, dynamic>> positionsList = await firebaseController.getAllPositions();
    List<Marker> newMarkers = [];
    String uid =  authenticationController.getCurrentUserId();
    
    for (int i = 0; i < positionsList.length; i++) {

      if(positionsList[i]["uid"] != uid){
        Marker newMarker = Marker(
        markerId: MarkerId('markera'+i.toString()),
        position: LatLng(positionsList[i]['latitude'], positionsList[i]['longitude']),
        infoWindow: InfoWindow(title: positionsList[i]["userName"]),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
        );

        newMarkers.add(newMarker);
      }
      
    }
    
    if(newMarkers.isNotEmpty){
      setState(() {
        markers.addAll(newMarkers);
      });
    }

    myPosition["userName"] = authenticationController.userName;
    myPosition["uid"] = uid;
    firebaseController.updatePosition(myPosition);

  }
}
