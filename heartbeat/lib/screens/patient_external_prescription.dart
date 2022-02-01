// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';

class PatientExternalPrescriptios extends StatelessWidget {
  const PatientExternalPrescriptios({Key? key}) : super(key: key);

  static const String routeName = 'patient external presc screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DummyLists.oldPrescImages.isEmpty
          ? Center(child: Text('No Old Prescriptions Uploaded'))
          : ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: DummyLists.oldPrescImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      DummyLists.oldPrescImages[index]['image'] as File,
                      // fit: BoxFit.cover,
                    ),
                  ),

                  // title:
                  //     Text(DummyLists.oldPrescImages[index]['date'] as String),
                  // onTap: ,
                );
              }),
    );
  }
}
