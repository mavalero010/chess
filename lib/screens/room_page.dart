import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/models/curso_item.dart';
import 'package:proyecto_ui/screens/add_course.dart';
import '../models/curso.dart';

class RoomPageWidget extends StatelessWidget {

  RoomPageWidget({Key? key, required this.room}) : super(key: key);

  final String room;

  FirebaseController firebaseController = Get.find();
  //AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    firebaseController.getCoursesListByRoom(room);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 241, 247, 1),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(48, 48)),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Cursos',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(29, 25, 43, 1),
                        fontFamily: 'Inter',
                        fontSize: 26,
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                        height: 1.3125),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      'Mis Cursos',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Inter',
                          fontSize: 16,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.bold,
                          height: 1.3),
                    ),
                  ],
                ),
              ),
              Obx(
                () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: firebaseController.cursosListByRoom.length,
                    itemBuilder: (context, index) {
                      return _row(firebaseController.cursosListByRoom[index], index);
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _row(CursoItem item, int index) {
    return _card(item, index);
  }

  Widget _card(CursoItem item, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: const Color.fromRGBO(73, 69, 79, 1),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      'assets/images/Ajedrez.png',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //'3 h 30 min',
                          item.time,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(80, 87, 254, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.bold,
                              height: 1.3),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //'Ajedrez para principiantes',
                          item.name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Inter',
                              fontSize: 22,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.normal,
                              height: 1.3),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //'Paso a paso para principiantes',
                          item.desc,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(73, 69, 79, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.normal,
                              height: 1.3),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
