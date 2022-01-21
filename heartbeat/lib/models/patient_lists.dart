import 'package:flutter/material.dart';

class PatientLists {
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
}
