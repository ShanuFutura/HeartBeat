import 'package:flutter/material.dart';
// import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class PatientsAppoinments extends StatelessWidget {
  const PatientsAppoinments({Key? key}) : super(key: key);
  static String routeName = 'patients appoinments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: Provider.of<DBHelper>(context).viewPatientAppoinments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: Text(
                              (snapshot.data as dynamic)['doc_name'],
                              style: TextStyle(fontSize: 23),
                            ),
                            trailing: Chip(
                              label: Text(
                                (snapshot.data as dynamic)['time_slot'],
                                style: TextStyle(fontSize: 23),
                              ),
                            )),
                        Divider(),
                      ],
                    );
                  });
            }
          },
        ));
  }
}
