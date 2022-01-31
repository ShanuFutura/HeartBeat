import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/login_card.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doctor_view.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:heartbeat/Widgets/patient_signup_card.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'LoginScreen';
  String username = '';
  String email = '';
  String password = '';
  bool isLogin = false;
  //

  Future<void> tryAuth(
    String uname,
    // String mail,
    String pword,
    // bool iLogin,
    BuildContext context,
  ) async {
    username = uname;
    // email = mail;
    password = pword;
    // isLogin = iLogin;
    print(uname + ' ' + pword);
    // Navigator.of(context).pushReplacementNamed(DocHomePage.routeName);
    final pref = await SharedPreferences.getInstance();
    pref.setString(
        'authTok', uname); // PATIENT OR DC HAS TO BE SELECTED DEPENDING
    Navigator.of(context).pushNamed(
        uname == 'patient' ? PatientHomePage.routeName : DocHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // final String arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/heart.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: LoginCard(tryAuth),
        ),
      ),
    );
  }
}
