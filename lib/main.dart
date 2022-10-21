import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/firebase_cental.dart';
import 'package:proyecto_ui/screens/content_page.dart';
import 'package:proyecto_ui/screens/login.dart';
import 'package:proyecto_ui/screens/register.dart';
import 'package:proyecto_ui/screens/home_teacher.dart';
import 'package:proyecto_ui/screens/home_student.dart';
import 'package:proyecto_ui/screens/my_courses.dart';
import 'package:proyecto_ui/screens/profile.dart';
import 'package:proyecto_ui/screens/play.dart';
import 'package:proyecto_ui/screens/blog.dart';

import 'controllers/authentication_controller.dart';
import 'controllers/controller.dart';
import 'controllers/location_controller.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    //name: "name-chess",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AndroidGoogleMapsFlutter.useAndroidViewSurface = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  AuthenticationController authenticationController = Get.put(AuthenticationController());
  
  @override
  Widget build(BuildContext context) {
    
    Get.put(Controller());
    Get.put(LocationController());
    Get.put(FirebaseController());

    

    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(body: getBody()
        ))
        );
  }

  Widget getBody(){
    if(!(FirebaseAuth.instance.currentUser == null)){
      authenticationController.logged.value = true;
    }
    return Obx(() {
      bool logged = authenticationController.logged.value;
      if(!logged){
        return LoginWidget();
      }else{
        if(authenticationController.userInfoState.value == 0){
              authenticationController.getUserInfo();
              return const Loading();
            } 
            return ContentPage();
            }
    });
  }

}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Error")),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
