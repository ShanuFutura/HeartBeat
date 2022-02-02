import 'package:flutter/cupertino.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/login_screen.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper extends ChangeNotifier {
  // static bool authTok=false;

  String loginId = '';

  bool loginCall(
    String username,
    String password,
  ) {
//send to backend
//gets isLOginSuccessful ,login id, userCategory
    return true;
  }

  void signupCall(
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

  Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('authTok', 'nop');
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  bool patientProfUpdate(
    // String login_id,
    String name,
    String age,
    String gender,
    String email,
    String mobile,
  ) {
    print('{$name,$age,$gender,$email,$gender,$mobile,}');
    return true;
  }

  // static feedBack

  void feedBackCall(String feed) {
    print(feed);
  }

  void addAppoinment(String time_slot) {
    print(time_slot);

    // return Future.delayed(Duration(seconds: 1)).then((_) {
    //   return true;
    // });
  }

  void applyLeave(DateTime date) {
    print(date.toString());
  }

  bool isDocAvailable(int docId) {
    return true;
  }

  int availableTimeSlotsCount(String doc) {
    final tempList = DummyLists.docTimeSlots
        .where((element) => element['doc_name'] == doc)
        .toList();
    print(tempList);
    return tempList.length;
  }
}
