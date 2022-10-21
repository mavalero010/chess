import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/screens/room_page.dart';
import '../models/curso.dart';

class HomeStudentWidget extends StatelessWidget {

  AuthenticationController authenticationController = Get.find();
  FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    firebaseController.getCoursesListByTeacherId("0");
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(236, 241, 247, 1),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hola',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(73, 69, 79, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.bold,
                              height: 1.3),
                        ),
                        Text(
                          //'John Doe',
                          authenticationController.userName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(73, 69, 79, 1),
                              fontFamily: 'Inter',
                              fontSize: 26,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.bold,
                              height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: IconButton(
                    icon: const Icon(Icons.notifications),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(73, 69, 79, 1),
                      width: 1,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(48, 48)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
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
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Text(
                        'Buscar dentro de tus cursos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            fontFamily: 'Inter',
                            fontSize: 15,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.normal,
                            height: 1.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Center(
                          child: Image.asset(
                        'assets/images/search.png',
                        height: 20,
                        width: 20,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Salas',
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
          InkWell(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomPageWidget(room: "principiantes",)),
              );
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(235, 238, 255, 1)),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(18),
                            child: Image.asset('assets/images/Ajedrez.png'),
                          ),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sala principiantes',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Curso completo de Ajedrez',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.normal,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          /*const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 8.0),
            child: Divider(color: Color.fromRGBO(73, 69, 79, 1)),
          ),*/
          InkWell(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomPageWidget(room: "intermedios",)),
              );
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(235, 238, 255, 1)),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(18),
                            child: Image.asset('assets/images/Ajedrez.png'),
                          ),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sala Intermedios',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Curso completo de Ajedrez',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.normal,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomPageWidget(room: "expertos",)),
              );
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(235, 238, 255, 1)),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(18),
                            child: Image.asset('assets/images/Ajedrez.png'),
                          ),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sala Avanzados',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Curso completo de Ajedrez',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.normal,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ]),
      ),
    );
  }

  Widget _row(Curso item, int index) {
    return _card(item, index);
  }

  Widget _card(Curso item, int index) {
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
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3 h 30 min',
                          textAlign: TextAlign.left,
                          style: TextStyle(
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
                          'Ajedrez para principiantes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
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
                          'Paso a paso para principiantes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
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
