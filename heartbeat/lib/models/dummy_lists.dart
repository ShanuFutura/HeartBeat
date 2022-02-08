// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';

// class MedicinePrescription {
//   final String medicine;
//   final DateTime date;
//   final int quantity;
//   final String docName;
//   MedicinePrescription(
//     this.medicine,
//     this.date,
//     this.quantity,
//     this.docName,
//   );
// }

// class TestPrescription {
//   final String test;
//   final DateTime date;
// final int quantity;
// TestPrescription(
//   this.test,
//   this.date,
//   // this.quantity,
// );
// }

class DummyLists {
  static List lab = [];
  static List uploadedPrescFiles = [];
  static List<Map<String, Object>> appoinments = [];
  static List kart = [];
  static List<Map<String, Object>> appliedLeaves = [
    {'date': DateTime.now(), 'approval': 'waiting'},
    {'date': DateTime.now(), 'approval': 'approved'},
    {'date': DateTime.now(), 'approval': 'denied'},
    {'date': DateTime.now(), 'approval': 'waiting'},
  ];
  // static Map<String, List<>>
  static List<Map<String, Object>> oldPrescImages = [];
  // static List newPrescList = [];

  static final dummyPrescs = [
    {
      'doctor_name': 'Alice',
      'patient_id': '1',
      'presc_type': 'test',
      'prescription': 'blood test',
      'date': DateTime.now().subtract(Duration(days: 1)),
      'count': '1',
    },
    {
      'doctor_name': 'Alice',
      'patient_id': '1',
      'presc_type': 'medicine',
      'prescription': 'aspirine',
      'date': DateTime.now().subtract(Duration(days: 1)),
      'count': '1',
    },
    {
      'doctor_name': 'Bob',
      'patient_id': '1',
      'presc_type': 'medicine',
      'prescription': 'paracetamol',
      'date': DateTime.now(),
      'count': '4'
    },
    {
      'doctor_name': 'Edith',
      'patient_id': '1',
      'presc_type': 'test',
      'prescription': 'corona test',
      'date': DateTime.now(),
      'count': '1'
    },
    {
      'doctor_name': 'David',
      'patient_id': '1',
      'presc_type': 'medicine',
      'prescription': 'paracetamol',
      'date': DateTime.now().subtract(Duration(days: 4)),
      'count': '4'
    },
    {
      'doctor_name': 'David',
      'patient_id': '1',
      'presc_type': 'test',
      'prescription': 'TB test',
      'date': DateTime.now().subtract(Duration(days: 4)),
      'count': '1'
    },
    // {
    //   'doctor_name': 'Carl',
    //   'patient_id': '1',
    //   'presc_type': 'medicine',
    //   'prescripton': 'antibiotic',
    //   'date': DateTime.now(),
    //   'count': '2'
    // },
    // {
    //   'doctor_name': 'Daisy',
    //   'patient_id': '1',
    //   'presc_type': 'test',
    //   'prescripton': 'corona',
    //   'date': DateTime.now(),
    //   'count': '1'
    // },
    // {
    //   'doctor_name': 'Edith',
    //   'patient_id': '1',
    //   'presc_type': 'test',
    //   'prescripton': 'blood test',
    //   'date': DateTime.now().subtract(Duration(days: 1)),
    //   'count': '1',
    // },
  ];

  // static List<Map<String, Object>> testPrescList = [];
  // static const List<Map<String, String>> labtestReportsList = [
  //   {'content': 'content', 'date': 'date'},
  //   {'content': 'content', 'date': 'date'},
  //   {'content': 'content', 'date': 'date'},
  //   {'content': 'content', 'date': 'date'},
  //   {'content': 'content', 'date': 'date'}
  // ];

  static var docTimeSlots = [
    {'doc_name': 'Alice', 'time_slot': '09:00'},
    {'doc_name': 'Alice', 'time_slot': '09:00'},
    {'doc_name': 'Alice', 'time_slot': '09:00'},
    {'doc_name': 'Alice', 'time_slot': '09:00'},
    {'doc_name': 'Alice', 'time_slot': '09:00'},
    {'doc_name': 'Alice', 'time_slot': '09:00'},
  ];

  // static const List<Map<String, String>> prescriptionsList = [
  //   {
  //     'PrescriptionId': 'idNo',
  //     'PrescriptionDate': 'Date',
  //     'contents': 'contents',
  //   },
  //   {
  //     'PrescriptionId': 'idNo',
  //     'PrescriptionDate': 'Date',
  //     'contents': 'contents',
  //   },
  //   {
  //     'PrescriptionId': 'idNo',
  //     'PrescriptionDate': 'Date',
  //     'contents': 'contents',
  //   },
  //   {
  //     'PrescriptionId': 'idNo',
  //     'PrescriptionDate': 'Date',
  //     'contents': 'contents',
  //   },
  //   {
  //     'PrescriptionId': 'idNo',
  //     'PrescriptionDate': 'Date',
  //     'contents': 'contents',
  //   },
  // ];

  static List<Map<String, String>> patientsList = [
    {'patientName': 'patient name', 'patientAge': 'age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
    {'patientName': 'patient name', 'patientAge': 'Age', 'gender': 'gender'},
  ];

  static List<ListTile> patients = [
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
    ListTile(
      leading: CircleAvatar(),
      title: Text('title'),
      subtitle: Text('Subtitle'),
      trailing: TextButton(onPressed: () {}, child: Text('View')),
    ),
  ];

  static List<String> medicines = [
    'medicine name 1',
    'medicine name 2',
    'medicine name 3',
    'medicine name 4',
  ];

  static List<Map<String, Object>> tests = [
    {'test_name': 'blood test', 'price': 200.00},
    {'test_name': 'corona test', 'price': 250.00},
    {'test_name': 'cholestrol test', 'price': 150.00},
    {'test_name': 'sugar test', 'price': 100.00},
  ];

  static const List<Map<String, Object>> docsList = [
    {
      'value': 1,
      'message': 'successful',
      'doc_name': 'Alice',
      'department': 'Nuerology',
      'qualification': 'MD',
      'gender': 'male',
      'email': 'alice@abd.com',
      'mobile': '99999999',
      'experience': '3'
    },
    {
      'value': 1,
      'message': 'successful',
      'doc_name': 'Bob',
      'department': 'Cardiology',
      'qualification': 'MD',
      'gender': 'male',
      'email': 'alice@abd.com',
      'mobile': '99999999',
      'experience': '3'
    },
    {
      'value': 1,
      'message': 'successful',
      'doc_name': 'Carl',
      'department': 'Gynacology',
      'qualification': 'MD',
      'gender': 'male',
      'email': 'alice@abd.com',
      'mobile': '99999999',
      'experience': '3'
    },
    {
      'value': 1,
      'message': 'successful',
      'doc_name': 'Daisy',
      'department': 'Orthology',
      'qualification': 'MD',
      'gender': 'male',
      'email': 'alice@abd.com',
      'mobile': '99999999',
      'experience': '3'
    }
  ];

  // static const List<String> docsList = [
  //   'docName 1',
  //   'docName 2',
  //   'docName 3',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 4',
  //   'docName 5',
  //   'docName 6',
  //   'docName 7docName 7docName',
  //   'docName 7docName 7docName',
  //   'docName 7docName 7docName',
  //   'docName 7docName 7docName',
  // ];
}
