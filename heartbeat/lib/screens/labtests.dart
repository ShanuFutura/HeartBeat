import 'package:flutter/material.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class LabTests extends StatelessWidget {
  const LabTests({Key? key}) : super(key: key);
  static String routeName = 'labtests';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: Provider.of<DBHelper>(context).labtests(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data'),
              );
            } else {
              return ListView.builder(
                  itemCount: (snapshot.data as List).length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: Text(
                              (snapshot.data as dynamic)[index]['medicine'],
                              style: TextStyle(fontSize: 23),
                            ),
                            trailing: Chip(
                              label: Text(
                                (snapshot.data as dynamic)[index]['price'],
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
