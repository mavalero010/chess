import 'package:flutter/material.dart';

void main() => runApp(SettingsWidget());

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String notificaciones = "Notificaciones";

  @override
  Widget box_info(String description, Widget bt) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 241, 247, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: Color.fromRGBO(73, 69, 79, 1),
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(235, 238, 255, 1),
                          ),
                          child: Stack(children: <Widget>[
                            Positioned(
                              top: 5,
                              left: 5,
                              child: bt,
                            ),
                          ])),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  description,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 25, 43, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.normal,
                                      height: 1.3),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Container(
                  decoration: BoxDecoration(
            color: Color.fromRGBO(236, 241, 247, 1),
                  ),
                  child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
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
                      Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Configuración',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 25, 43, 1),
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
                              notificaciones,
                              IconButton(
                                icon: Icon(Icons.notifications),
                                color: Color.fromRGBO(80, 87, 254, 1),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {},
                              )),
                        ],
                      ))
                    ],
                  ),
                ],
              ))
            ],
                  ),
                ),
          ));
  }
}
