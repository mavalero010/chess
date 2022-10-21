import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/screens/content_page.dart';

import 'login.dart';

class RegisterWidget extends StatelessWidget {
  static const _colorPrimary = Color(0xFF4E55F7);
  static const _colorBPrimary = Color(0xFFEBEEFF);
  static const _colorSecondary = Color(0xFF1D192B);
  static const _colorBSecondary = Color(0xFF49454F);
  static const _colorNeutral = Color(0xFFECF1F7);

  AuthenticationController authenticationController = Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final fechaController = TextEditingController();
  final passController = TextEditingController();

  void click() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: _colorNeutral),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Registrarse",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Crea tu cuenta",
                    style: TextStyle(
                        color: _colorSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 343,
                    height: 56,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Nombre",
                          labelStyle: TextStyle(color: _colorBSecondary),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _colorBSecondary),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      controller: emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Correo",
                          labelStyle: TextStyle(color: _colorBSecondary),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _colorBSecondary),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      controller: fechaController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Fecha de nacimiento",
                          labelStyle: TextStyle(color: _colorBSecondary),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _colorBSecondary),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      controller: passController,
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
                          labelText: "Contraseña",
                          labelStyle: TextStyle(color: _colorBSecondary),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _colorBSecondary),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(width: 343, alignment: AlignmentDirectional.topStart, child: const Text("Tipo de Usuario")),
                  Obx(()=> Column(
                    children: [
                      RadioListTile(
                        title: const Text('Estudiante'),
                        value: SingingCharacter.student,
                          groupValue: authenticationController.getRole(),
                          onChanged: (SingingCharacter? value) {
                            authenticationController.updateRole(value);
                          },
                      ),
                      RadioListTile(
                        title: const Text('Maestro'),
                        value: SingingCharacter.teacher,
                          groupValue: authenticationController.getRole(),
                          onChanged: (SingingCharacter? value) {
                            authenticationController.updateRole(value);
                          },
                      ),
                    ]),
                  ),
                  GestureDetector(
                    onTap: () => clickRegistrarse(context),
                    child: Container(
                      alignment: Alignment.center,
                      width: 343,
                      height: 56,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: _colorPrimary),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginWidget()),
                          );
                        },
                        child: const Text('Iniciar sesión',
                            style: TextStyle(
                                color: _colorSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void clickRegistrarse(BuildContext context) {
    /*authenticationController.login('donny@mail.com', '123456').then((value) {
      
    });*/

    String email = emailController.text;
    String pass = passController.text;
    String name = nameController.text;

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid && pass.length > 5 && name.isNotEmpty) {
      /*authenticationController.registerUser(name, email, pass, authenticationController.getRole().toString()).then((value) {
        if (value == "true") {
          authenticationController.login(email, pass).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ContentPage()),
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sign up Error"),
          ));
        }
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      });*/

    authenticationController.signup(email, pass).then((value) {
      authenticationController.crearUsuarioDB(name, email, authenticationController.getRole().toString().split('.').last).then((value){
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContentPage()),
        );*/
        authenticationController.logged.value = true;
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      });
      
    }).catchError((e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Email or Password"),
      ));
    }
  }
}
