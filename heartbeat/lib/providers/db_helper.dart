import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<bool> loginCall(
    String username,
    String password,
  ) async {
    final url = Uri.parse(urlS + 'Login.php');
    final res =
        await post(url, body: {'username': username, 'password': password});
    print('=======' + json.decode(res.body).toString());

    if (json.decode(res.body)['message'] == 'User Successfully LoggedIn') {
      loginId = json.decode(res.body)['id'];
      print(loginId);
      final pref = await SharedPreferences.getInstance();

      if (json.decode(res.body)['type'] == 'patient') {
        print(json.decode(res.body)['type']);

        // final pref = await SharedPreferences.getInstance();
        pref.setString('authTok', 'patient');
      } else {
        print(json.decode(res.body)['type']);

        // final pref = await SharedPreferences.getInstance();
        pref.setString('authTok', 'doc');
      }
      return true;
    } else {
      return false;
    }
  }

  // var isFetchingBool = false;

  // bool get isFetching {
  // return isFetchingBool;
  // }

  String get login_id {
    return loginId;
  }

  Future<String> signupCall(
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
    try {
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
      // print(
      //   '{$username, $gender, $age, $email, $mobile, $name, $password}',
      // );
      Future<void> setToken() async {
        final pref = await SharedPreferences.getInstance();
        pref.setString('authTok', 'patient');
      }

      if (res.body == 'Registration Successfull...') {
        setToken();

        Navigator.of(context).pushNamed(PatientHomePage.routeName);
      }
      return 'ok';
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('authTok', 'nop');
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  Future<List?> fetchAndSetDoctorsList(BuildContext context) async {
    // isFetchingBool = true;
    try {
      final url = Uri.parse(urlS + 'doctor_list.php');
      final res = await get(url);
      // isFetchingBool = false;
      // print(res.body);
      final tempList = jsonDecode(res.body) as List;
      print(tempList.length.toString());
      DummyLists.docsList.addAll(tempList);
      print(DummyLists.docsList);
      return tempList;
    } on SocketException catch (error) {
      print('connnection error--' + error.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('CONNECTION ERROR'),
            );
          }).then((value) => null);
    }

    // notifyListeners();
    // print(json.decode(res.body)[1]['doc_name']);

    // final url2 = Uri.parse(urlS + 'appointment_view');
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

  Future<void> feedBackCall(String feed) async {
    final url = Uri.parse(urlS + 'send_feedback.php');
    final res = await post(url,
        body: {'login_id': login_id.toString(), 'feedback': feed});
    print(res.body);
    // print(feed);
  }

  void addAppoinment(String time_slot, String docName) async {
    final url = Uri.parse(urlS + 'add_appointment.php');
    post(url, body: {
      "login_id": login_id,
    });
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

  Future<String> isDocAvailable(int docId) async {
    final url = Uri.parse(urlS + 'leave_status_view.php');
    final res = await post(url, body: {'doctor_id': docId.toString()});
    print(res.body.toString());
    return jsonDecode(res.body)['message'];
  }

  Future<int> availableTimeSlotsCount(int doc) async {
    DummyLists.docTimeSlots = [
      {'time_slot': '09:00'},
      {'time_slot': '09:15'},
      {'time_slot': '09:20'},
      {'time_slot': '09:25'},
      {'time_slot': '09:30'},
      {'time_slot': '09:35'},
      {'time_slot': '09:45'},
      {'time_slot': '10:00'},
    ];
    print('docId' + doc.toString());
    final url = Uri.parse(urlS + 'appointment_view.php');
    final res = await post(url, body: {'doctor_id': doc.toString()});
    final bookedSlots = jsonDecode(res.body) as List;
    // final bookedSlots=bookedSlotsTemp.w
    print('tempList' + bookedSlots.toString());
    // final tempList = DummyLists.docTimeSlots.where((el) {
    //   return bookedSlots
    //       .any((element) => element['time_slot'] != el['time_slot']);
    // });
    // bookedSlots.map((e) => DummyLists.docTimeSlots
    //     .removeWhere((element) => element['time_slot'] == e['time_slot']));
    DummyLists.docTimeSlots.removeWhere((ele) => (bookedSlots
        .any((element) => ele['time_slot'] == element['time_slot'])));
    final tempList = [];
    // DummyLists.docTimeSlots.map((e) {});

    // DummyLists.docTimeSlots.addAll(tempList);
    // DummyLists.docTimeSlots = tempList;
    print('-----' + DummyLists.docTimeSlots.toString());
    return DummyLists.docTimeSlots.length;
  }

  double getPrices(String item) {
    return 25.0;
  }
}
