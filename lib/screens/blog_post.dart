import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/models/blog_item.dart';

class AddBlogPostWidget extends StatefulWidget {
  @override
  _AddBlogPostWidgetState createState() => _AddBlogPostWidgetState();
  final BlogItem item;
  const AddBlogPostWidget({Key? key, required this.item}) : super(key: key);
}

class _AddBlogPostWidgetState extends State<AddBlogPostWidget> {
  final FirebaseController firebaseController = Get.find();
  final AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
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
                          "Publicación", //widget.item.titulo,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(29, 25, 43, 1),
                              fontFamily: 'Inter',
                              fontSize: 24,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  widget.item.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Inter',
                      fontSize: 26,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                      height: 1.3125),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                    height: 200,
                    child: Stack(fit: StackFit.expand, children: [
                      Image.asset(
                        'assets/images/Ajedrez.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ]),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  widget.item.desc,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      letterSpacing: -1,
                      fontWeight: FontWeight.normal,
                      height: 1.3125),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
