import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/screens/add_course.dart';
import 'package:proyecto_ui/screens/room_page.dart';
import 'package:proyecto_ui/screens/play_course.dart';
import '../models/curso_item.dart';

class HomeTeacherWidget extends StatelessWidget {
  FirebaseController firebaseController = Get.find();
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    firebaseController
        .getCoursesListByTeacherId(authenticationController.getCurrentUserId());
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
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Crea cursos para tus estudiantes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Ayuda a mejorar sus habilidades y técnicas',
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
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCourseWidget()),
                          );
                        },
                        child: Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 12.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Color.fromRGBO(80, 87, 254, 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Crear curso',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.normal,
                                      height: 1.3),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
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
                itemCount: firebaseController.cursosList.length,
                itemBuilder: (context, index) {
                  return _row(firebaseController.cursosList[index], index, context);
                }),
          )
        ]),
      ),
    );
  }

  Widget _row(CursoItem item, int index, BuildContext context) {
    print(item);
    return _card(item, index, context);
  }

  Widget _card(CursoItem item, int index, BuildContext context) {
    return
    InkWell(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoPlayerScreen(item: item,)),
        );
      },
      child:
    Expanded(
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
    ));
  }
}
