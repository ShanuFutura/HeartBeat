import 'package:flutter/material.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doctor_view.dart';
import 'package:heartbeat/screens/patient_external_prescription.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_profile_edit_screen.dart';
import 'package:heartbeat/screens/patient_signup_page.dart';
// import 'package:heartbeat/screens/login_category.dart';
import 'package:heartbeat/screens/login_screen.dart';
import 'package:heartbeat/screens/patient_view.dart';

void main() => runApp(HeartBeat());

class HeartBeat extends StatelessWidget {
  const HeartBeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DocHomePage(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        PatientSignupPage.routeName: (ctx) => PatientSignupPage(),
        DocHomePage.routeName: (ctx) => DocHomePage(),
        PatientView.routeName: (ctx) => PatientView(),
        PatientHomePage.routeName: (ctx) => PatientHomePage(),
        DoctorView.routeName: (ctx) => DoctorView(),
        PatientProfilEditScreen.routeName: (ctx) => PatientProfilEditScreen(),
        PatientExternalPrescriptios.routeName: (ctx) =>
            PatientExternalPrescriptios(),
      },
    );
  }
}
