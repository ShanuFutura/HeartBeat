import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/ip_dialog.dart';
import 'package:heartbeat/Widgets/login_card.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/doc_home_page.dart';

import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

var isLoading = false;

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    final isAuth = await Provider.of<DBHelper>(context, listen: false)
        .loginCall(username, password);

    if (isAuth) {
      final pref = await SharedPreferences.getInstance();
      final tok = pref.getString('authTok');
      Navigator.of(context).pushNamed(
          tok == 'patient' ? PatientHomePage.routeName : DocHomePage.routeName);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Error Loging in',
              ),
              content: Text('Couldn\'t log you in please check credentials'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CircularProgressIndicator();
          });
    }

    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (contex) {
                return IPDialog();
              });
        },
        child: Icon(Icons.info_outline),
      ),
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
