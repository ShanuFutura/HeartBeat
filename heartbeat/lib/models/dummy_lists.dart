// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';

class MedicinePrescription {
  final String medicine;
  final DateTime date;
  final int quantity;
  final String docName;
  MedicinePrescription(
    this.medicine,
    this.date,
    this.quantity,
    this.docName,
  );
}

class TestPrescription {
  final String test;
  final DateTime date;
  // final int quantity;
  TestPrescription(
    this.test,
    this.date,
    // this.quantity,
  );
}

class DummyLists {
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
  static List<MedicinePrescription> newMedPrescList = [
    MedicinePrescription(
        'Paracetamol', DateTime.now().subtract(Duration(days: 9)), 2, 'Alice'),
    MedicinePrescription(
        'Antibiotic', DateTime.now().subtract(Duration(days: 15)), 2, 'Bob'),
    MedicinePrescription(
        'medicine', DateTime.now().subtract(Duration(days: 4)), 2, 'Carl'),
    MedicinePrescription(
        'medicine', DateTime.now().subtract(Duration(days: 6)), 2, 'Daisy'),
  ];

  static List<TestPrescription> newTestPrescList = [];
  static const List<Map<String, String>> labtestReportsList = [
    {'content': 'content', 'date': 'date'},
    {'content': 'content', 'date': 'date'},
    {'content': 'content', 'date': 'date'},
    {'content': 'content', 'date': 'date'},
    {'content': 'content', 'date': 'date'}
  ];

  static var docTimeSlots = [
    '09:00',
    '09:15',
    '09:30',
    '09:45',
    '10:00',
    '10:15',
    '10:30',
    '10:45',
    '11:00',
    '11:15',
    '11:30',
    '11:45',
    '12:00',
    '12:15',
    '12:30',
    '12:45'
  ];

  static const List<Map<String, String>> prescriptionsList = [
    {
      'PrescriptionId': 'idNo',
      'PrescriptionDate': 'Date',
      'contents': 'contents',
    },
    {
      'PrescriptionId': 'idNo',
      'PrescriptionDate': 'Date',
      'contents': 'contents',
    },
    {
      'PrescriptionId': 'idNo',
      'PrescriptionDate': 'Date',
      'contents': 'contents',
    },
    {
      'PrescriptionId': 'idNo',
      'PrescriptionDate': 'Date',
      'contents': 'contents',
    },
    {
      'PrescriptionId': 'idNo',
      'PrescriptionDate': 'Date',
      'contents': 'contents',
    },
  ];

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

  static List<String> tests = [
    'test name 1',
    'test name 2',
    'test name 3',
    'test name 4',
    'test name 5',
  ];
  static const List<String> docsList = [
    'docName 1',
    'docName 2',
    'docName 3',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 4',
    'docName 5',
    'docName 6',
    'docName 7docName 7docName',
    'docName 7docName 7docName',
    'docName 7docName 7docName',
    'docName 7docName 7docName',
  ];
}
