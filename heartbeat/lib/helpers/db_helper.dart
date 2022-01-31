import 'package:flutter/cupertino.dart';
import 'package:heartbeat/screens/login_screen.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  // static bool authTok=false;
  static signupCall(
    String name,
    String age,
    String gender,
    String email,
    String mobile,
    String username,
    String password,
    BuildContext context,
  ) {
    print(
      '{$username, $gender, $age, $email, $mobile, $name, $password}',
    );
    Future<void> setToken() async {
      final pref = await SharedPreferences.getInstance();
      pref.setString('authTok', 'patient');
    }

    if (true) {
      setToken();

      Navigator.of(context).pushNamed(PatientHomePage.routeName);
    }
  }

  static Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('authTok', 'nop');
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }
}
