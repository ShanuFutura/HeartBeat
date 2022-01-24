import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doctor_view.dart';
// import 'package:flutter_search_bar/flutter_search_bar.dart';

class PatientHomePage extends StatelessWidget {
  // const PatientHomePage({ Key? key }) : super(key: key);

  static const String routeName = 'patient home';
  // final SearchBar searchBar = SearchBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton(
              underline: Container(),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              items: [
                ...DummyLists.docsList
                    .map((e) => DropdownMenuItem(
                          child: Container(
                            child: Text(e),
                          ),
                          value: e,
                        ))
                    .toList(),
              ],
              onChanged: (v) {
                Navigator.of(context)
                    .pushReplacementNamed(DoctorView.routeName, arguments: v);
              },
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
