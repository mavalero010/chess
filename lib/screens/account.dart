import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_ui/screens/password.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:get/get.dart';


void main() => runApp(AccountWidget());

class AccountWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final AuthenticationController authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AccountWidget - FRAME
    String name = "John Doe";
    String nombre = "Nombre";
    String birthday = "21/12/2012";
    String cumpleanos = "Fecha de cumpleaños";
    String email = "John@doe.com";
    String correo = "Email";
    String password = "**********";
    String contrasena = "Contraseña";
    String direction = "Km. 5 Puerto Colombia";
    String direccion = "Dirección";

    Widget box_info(String info, String description, Widget bt) {
      if (description == "Contraseña") {
        return Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasswordWidget()),
              );
            },
            child: Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
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
                      Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Color.fromRGBO(235, 238, 255, 1)),
                          child: Center(
                              child: Image.asset(
                            'assets/images/user.png',
                            width: 20,
                            height: 20,
                          ))),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Flexible(
                              flex: 1,
                              child: Text(
                                '**********',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(29, 25, 43, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    letterSpacing: -0.5,
                                    //fontWeight: FontWeight.normal,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Contraseña',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(73, 69, 79, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Center(
                            child: Image.asset(
                          'assets/images/right-arrow.png',
                          height: 20,
                          width: 20,
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: InkWell(
          onTap: () {},
          child: Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
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
                    Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(235, 238, 255, 1)),
                        child: Center(child: bt)),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Text(
                              info,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(29, 25, 43, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  letterSpacing: -0.5,
                                  //fontWeight: FontWeight.normal,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              description,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(73, 69, 79, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 241, 247, 1),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 5),
                                ),
                                Container(
                                  width: 48,
                                  height: 48,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(73, 69, 79, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(48, 48)),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  alignment: AlignmentDirectional.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Cuenta',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(29, 25, 43, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 32,
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.bold,
                                            height: 1.3125),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                box_info(
                                    authenticationController.userName,
                                    nombre,
                                    IconButton(
                                      icon: Icon(Icons.person),
                                      color: Color.fromRGBO(80, 87, 254, 1),
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {},
                                    )),
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                box_info(
                                  authenticationController.userEmail,
                                  correo,
                                  IconButton(
                                    icon: Icon(Icons.mail),
                                    color: Color.fromRGBO(80, 87, 254, 1),
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                box_info(password, contrasena, widget),
                              ],
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                box_info(
                                  birthday,
                                  cumpleanos,
                                  IconButton(
                                    icon: Icon(Icons.cake),
                                    color: Color.fromRGBO(80, 87, 254, 1),
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                box_info(
                                  direction,
                                  direccion,
                                  IconButton(
                                    icon: Icon(Icons.fmd_good_sharp),
                                    color: Color.fromRGBO(80, 87, 254, 1),
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    color: Color.fromRGBO(80, 87, 254, 1),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      MaterialButton(
                                        minWidth: 45,
                                        height: 60,
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 16.0,
                                              right: 16.0),
                                          child: Text(
                                            'Actualizar perfil',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Inter',
                                                fontSize: 18,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1.125),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
