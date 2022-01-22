import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/login_card.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
// import 'package:heartbeat/Widgets/patient_signup_card.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'LoginScreen';
  String username = '';
  String email = '';
  String password = '';
  bool isLogin = false;
  //
  void tryAuth(
    String uname,
    // String mail,
    String pword,
    // bool iLogin,
    BuildContext context,
  ) {
    username = uname;
    // email = mail;
    password = pword;
    // isLogin = iLogin;
    print(uname + ' ' + pword);
    // Navigator.of(context).pushReplacementNamed(DocHomePage.routeName);
    Navigator.of(context).pushNamed(PatientHomePage.routeName);
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
