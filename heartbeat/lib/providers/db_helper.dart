import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/login_screen.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:http/http.dart';
// import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

final urlS = 'http://192.168.29.78/Doctor_Patient/api/';

// final url = Uri.parse('http://192.168.29.78/Doctor_patient/api/');

class DBHelper extends ChangeNotifier {
  // static bool authTok=false;

  String loginId = '';

  List<Map<String, Object>> paymentProfile = [];

  bool loginCall(
    String username,
    String password,
  ) {
//send to backend
//gets isLOginSuccessful ,login id, userCategory
    return true;
  }

  Future<void> signupCall(
    String name,
    String age,
    String gender,
    String email,
    String mobile,
    String username,
    String password,
    BuildContext context,
  ) async {
    final url = Uri.parse(urlS + 'register.php');
    final res = await post(url, body: {
      'name': name,
      'age': age,
      'gender': gender,
      'email': email,
      'mobile': mobile,
      'username': username,
      'password': password,
    });
    print(res.body);
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

  void addAppoinment(String time_slot, String docName) {
    // print(time_slot);
    DummyLists.appoinments.add({'time_slot': time_slot, 'doc_name': docName});
    print(DummyLists.appoinments.toString());
    // return Future.delayed(Duration(seconds: 1)).then((_) {
    //   return true;
    // });
  }

  addImagePresc(File img, DateTime timestamp, String name) {
    DummyLists.oldPrescImages.add(
      {
        'image': img,
        'date': timestamp,
        'name': name,
      },
    );
    notifyListeners();
  }

  // bool isImagePoppedWithoutName = true;

  List get imagePresc {
    return DummyLists.oldPrescImages;
    // notifyListeners();
  }

  List get dummyPrescs {
    return DummyLists.dummyPrescs;
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

  double getPrices(String item) {
    return 25.0;
  }
}
