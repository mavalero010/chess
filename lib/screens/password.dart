import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'account.dart';

void main() => runApp(PasswordWidget());

class PasswordWidget extends StatefulWidget {
  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmNewPassController = TextEditingController();
  static const _colorPrimary = Color(0xFF4E55F7);
  //static const _colorBPrimary = Color(0xFFEBEEFF);
  static const _colorSecondary = Color(0xFF1D192B);
  static const _colorBSecondary = Color(0xFF49454F);
  static const _colorNeutral = Color.fromARGB(255, 255, 255, 255);
  Widget build(BuildContext context) {
    // Figma Flutter Generator PasswordWidget - FRAME

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
                        decoration: BoxDecoration(
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
                                            color:
                                                Color.fromRGBO(73, 69, 79, 1),
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
                                              'Contraseña',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      29, 25, 43, 1),
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
                                  ),
                                ]),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(236, 241, 247, 1),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 343,
                                  height: 56,
                                  child: TextField(
                                    controller: currentPassController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Contraseña actual",
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
                                  width: 343,
                                  height: 56,
                                  child: TextField(
                                    controller: newPassController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                        suffix: Icon(
                                          Icons.visibility,
                                          color: _colorBSecondary,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Nueva contraseña",
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
                                  width: 343,
                                  height: 56,
                                  child: TextField(
                                    controller: confirmNewPassController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                        suffix: Icon(
                                          Icons.visibility,
                                          color: _colorBSecondary,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Confirma nueva contraseña",
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
                                        child: const Text(
                                          'Actualizar contraseña',
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
                                        onPressed: updatePassWord,
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

  void updatePassWord() {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassController.text);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassController.text).then((_) {
        print("Success");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Contraseña Actualizada con Exito"),
        ));
        Navigator.pop(context);
      }).catchError((error) {
        //Error, show something
        print("Error 1:" + error.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error al Actualizar contraseña"),
        ));
      });
    }).catchError((error) {
      print("Error 2:" + error.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error al Actualizar contraseña"),
      ));
    });
  }
}
