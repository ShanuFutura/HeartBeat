import 'package:flutter/material.dart';

class PatientExternalPrescription extends StatelessWidget {
  String patientName;
  PatientExternalPrescription({Key? key, required this.patientName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(patientName),
      ],
    );
  }
}

class Person {
  String name;

  Person(this.name);

  details({String details = ""}) {
    print("my name is $name, $details");
  }
}

class Student extends Person {
  Student({name}) : super(name = "name");
}
