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
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate:);
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ListView.builder(
            itemCount: DummyLists.docsList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(DoctorView.routeName,
                          arguments: DummyLists.docsList[index]);
                    },
                    title: Text(DummyLists.docsList[index]),
                  ),
                  Divider(),
                ],
              );
            }));
  }
}
