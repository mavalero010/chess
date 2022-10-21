import 'package:flutter/material.dart';
import '../models/curso.dart';

class MisCursosWidget extends StatelessWidget {
  List<Curso> entries = <Curso>[
    Curso(0, 'Ajedrez para principiantes', '3 h 30 min',
        'Paso a paso para principiantes'),
    Curso(0, 'Ajedrez para principiantes', '3 h 30 min',
        'Paso a paso para principiantes')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 241, 247, 1),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Expanded(
                      child: Text(
                        'Mis cursos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            fontFamily: 'Inter',
                            fontSize: 26,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                      ),
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return _row(entries[index], index);
                  }),
            )
          ]),
        ),
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
