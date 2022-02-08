import 'package:flutter/material.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/cart_screen.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doc_leave_application.dart';
import 'package:heartbeat/screens/doc_profile_edit%20_screen.dart';
import 'package:heartbeat/screens/doctor_view.dart';
import 'package:heartbeat/screens/image_view_screen.dart';
import 'package:heartbeat/screens/loading_screen.dart';
import 'package:heartbeat/screens/patient_external_prescription.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_profile_edit_screen.dart';
import 'package:heartbeat/screens/patient_signup_page.dart';
// import 'package:heartbeat/screens/login_category.dart';
import 'package:heartbeat/screens/login_screen.dart';
import 'package:heartbeat/screens/patient_view.dart';
import 'package:heartbeat/screens/patients_appoinments.dart';
import 'package:heartbeat/screens/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider';

void main() => runApp(HeartBeat());

class HeartBeat extends StatelessWidget {
  const HeartBeat({Key? key}) : super(key: key);

  Future<String> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    final tok = pref.getString('authTok');
    return tok!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DBHelper(),
      child: MaterialApp(
        home: FutureBuilder(
          future: isAuth(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              print('waiting');

              return LaodingScreen();
            } else {
              print(snap.data.toString());
              if (snap.data == 'patient') {
                return PatientHomePage();
              } else if (snap.data == 'doc') {
                return DocHomePage();
              } else {
                return LoginScreen();
              }
            }
          },
        ),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          PatientSignupPage.routeName: (ctx) => PatientSignupPage(),
          DocHomePage.routeName: (ctx) => DocHomePage(),
          PatientView.routeName: (ctx) => PatientView(),
          PatientHomePage.routeName: (ctx) => PatientHomePage(),
          DoctorView.routeName: (ctx) => DoctorView(),
          PatientProfilEditScreen.routeName: (ctx) => PatientProfilEditScreen(),
          PatientExternalPrescriptios.routeName: (ctx) =>
              const PatientExternalPrescriptios(),
          DocProfileeditScreen.routeName: (ctx) => DocProfileeditScreen(),
          DocLeaveApplication.routeName: (ctx) => DocLeaveApplication(),
          CartScreen.routeName: (ctx) => CartScreen(),
          PatientsAppoinments.routeName: (ctx) => PatientsAppoinments(),
          PayemntScreen.routeName: (ctx) => PayemntScreen(),
          ImageViewScreen.routeName: (ctx) => ImageViewScreen(),

          // LaodingScreen.routeName: (ctx) => const LaodingScreen(),
        },
      ),
    );
  }
}
