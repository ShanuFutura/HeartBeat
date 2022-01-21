import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/login_card.dart';
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
  ) {
    username = uname;
    // email = mail;
    password = pword;
    // isLogin = iLogin;
    print(uname + ' ' + pword);
  }

  @override
  Widget build(BuildContext context) {
    // final String arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: LoginCard(tryAuth),
      ),
    );
  }
}
