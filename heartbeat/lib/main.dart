import 'package:flutter/material.dart';
import 'package:heartbeat/screens/patient_signup_page.dart';
// import 'package:heartbeat/screens/login_category.dart';
import 'package:heartbeat/screens/login_screen.dart';

void main() => runApp(HeartBeat());

class HeartBeat extends StatelessWidget {
  const HeartBeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        PatientSignupPage.routeName: (ctx) => PatientSignupPage(),
      },
    );
  }
}
