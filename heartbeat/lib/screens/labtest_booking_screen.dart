import 'package:flutter/material.dart';
import 'package:heartbeat/constants/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';
// import 'package:heartbeat/models/dummy_lists.dart';

class LabtestBookingScreen extends StatelessWidget {
  const LabtestBookingScreen({Key? key}) : super(key: key);

  static const String routeName = 'Lab test booking screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labtests'),
      ),
      body: FutureBuilder(
        future: Provider.of<DBHelper>(context).viewBookedTests(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snap.hasData) {
            return Center(
              child: Text('something went wrong'),
            );
          } else {
            return ListView.builder(
                itemCount: (snap.data as List).length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          (snap.data as dynamic)[index]['medicine'],
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Text((snap.data as dynamic)[index]['price']),
                      ),
                      Divider(),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
