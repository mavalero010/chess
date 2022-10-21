import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';


class AddBlogWidget extends StatefulWidget {
  @override
  _AddBlogWidgetState createState() => _AddBlogWidgetState();
}

class _AddBlogWidgetState extends State<AddBlogWidget> {
  final FirebaseController firebaseController = Get.find();
  final AuthenticationController authenticationController = Get.find();

  static const _colorPrimary = Color(0xFF4E55F7);
  //static const _colorBPrimary = Color(0xFFEBEEFF);
  static const _colorSecondary = Color(0xFF1D192B);
  static const _colorBSecondary = Color(0xFF49454F);
  static const _colorNeutral = Color.fromARGB(255, 255, 255, 255);


  final tituloController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();
  //final authController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(236, 241, 247, 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(children: [
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 5),
                                      ),
                                      Container(
                                        width: 48,
                                        height: 48,
                                        child: IconButton(
                                          icon:
                                              const Icon(Icons.arrow_back_ios),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 0),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                73, 69, 79, 1),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.elliptical(48, 48)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                        alignment: AlignmentDirectional.center,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Agregar Blog',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      29, 25, 43, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 26,
                                                  letterSpacing: -1,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3125),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                /*Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(236, 241, 247, 1),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                    ),
                                  ],
                                ),*/
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 343,
                                  height: 56,
                                  child: TextField(
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: tituloController,
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Titulo",
                                        labelStyle:
                                            TextStyle(color: _colorBSecondary),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _colorBSecondary),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 343,
                                  height: 56, //56,
                                  child: TextField(
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: descController,
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Descripción",
                                        labelStyle:
                                            TextStyle(color: _colorBSecondary),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _colorBSecondary),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                
                                SizedBox(
                                  width: 343,
                                  height: 56,
                                  child: TextField(
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Fecha de publicación",
                                        labelStyle:
                                            TextStyle(color: _colorBSecondary),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _colorBSecondary),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                          
                                Container(
                                  padding: const EdgeInsets.all(1.0),
                                  decoration: const BoxDecoration(
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
                                        minWidth: 40,
                                        height: 50,
                                        child: const Text(
                                          'Publicar blog',
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
                                        onPressed:() => publicarblog(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
    void publicarblog() {
    String titulo = tituloController.text;
    String desc = descController.text;
    String auth = authenticationController.userName;
    String date = dateController.text;
    //String room = "principiantes";
    String userId = authenticationController.getCurrentUserId();



    if(titulo.isNotEmpty && desc.isNotEmpty && auth.isNotEmpty) {
    
     
      Map<String, String> blog = {'titulo': titulo, 'desc': desc, 'auth': auth, 'userId': userId, 'date': date};

      firebaseController.addBlog(blog).then((value) {
        Navigator.pop(context);
      }).catchError((e) {
        print("Error: "+e.toString());
      });
      
      
    }else{
      print("Is Empty");
    }

  }
}