import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/controllers/authentication_controller.dart';
import 'package:proyecto_ui/main.dart';
import 'package:proyecto_ui/screens/content_page.dart';
import 'package:proyecto_ui/screens/home_teacher.dart';
import 'package:proyecto_ui/screens/register.dart';

class LoginWidget extends StatelessWidget {
  static const _colorPrimary = Color(0xFF4E55F7);
  //static const _colorBPrimary = Color(0xFFEBEEFF);
  static const _colorSecondary = Color(0xFF1D192B);
  static const _colorBSecondary = Color(0xFF49454F);
  static const _colorNeutral = Color.fromARGB(255, 255, 255, 255);

  final correoController = TextEditingController();
  final passController = TextEditingController();

  AuthenticationController authenticationController = Get.find();

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
                "Iniciar Sesión",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/caballo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 343,
                height: 56,
                child: TextField(
                  controller: correoController,
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
              Container(
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
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: TextButton(
                  onPressed: click,
                  child: const Text("¿Olvidaste tu contraseña?",
                      style: TextStyle(
                          color: _colorSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              GestureDetector(
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
                      'Iniciar sesión',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                onTap: () => openHomeScreen(context),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterWidget()),
                      );
                    },
                    child: const Text('Registrarse',
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

  void openHomeScreen(BuildContext context) {
    String email = correoController.text;
    String pass = passController.text;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid && pass.length > 5) {
      authenticationController.login(email, pass).then((value) {
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ContentPage()),
        );*/
        authenticationController.logged.value = true;
      });

      /*authenticationController.registerUser(name, email, pass)
      .then((value) => {
        if(value == "true"){
          authenticationController.login(email, pass)
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sign up Error"),
          ))
        }
      }
      ).catchError((e) => {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ))
      });*/

    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Email or Password"),
      ));
    }
  }
}
