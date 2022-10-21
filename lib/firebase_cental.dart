import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ui/screens/login.dart';

import 'screens/content_page.dart';

class FirebaseCentral extends StatefulWidget {
  const FirebaseCentral({Key? key}) : super(key: key);

  @override
  _FirebaseCentralState createState() => _FirebaseCentralState();
}

class _FirebaseCentralState extends State<FirebaseCentral> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ContentPage();
          } else {
            return LoginWidget();
          }
        });
  }
}
