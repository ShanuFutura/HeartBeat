import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/login_card.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
// import 'package:heartbeat/screens/doctor_view.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:provider/provider.dart';
// import 'package:heartbeat/screens/patient_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  String username = '';
  String email = '';
  String password = '';
  bool isLogin = false;

  Future<void> tryAuth(
    String uname,
    String pword,
    BuildContext context,
  ) async {
    username = uname;

    password = pword;

    print(uname + ' ' + pword);

    final isAuth = Provider.of<DBHelper>(context, listen: false)
        .loginCall(username, password);
    if (isAuth) {
      final pref = await SharedPreferences.getInstance();
      pref.setString(
          'authTok', uname); // PATIENT OR DC HAS TO BE SELECTED DEPENDING
      Navigator.of(context).pushNamed(uname == 'patient'
          ? PatientHomePage.routeName
          : DocHomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
