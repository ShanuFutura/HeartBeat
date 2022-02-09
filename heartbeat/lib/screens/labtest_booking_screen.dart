import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';

class LabtestBookingScreen extends StatelessWidget {
  const LabtestBookingScreen({Key? key}) : super(key: key);

  static const String routeName = 'Lab test booking screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('labtests'),
        ),
        body: DummyLists.lab.isEmpty
            ? Center(child: Text('No tests pending empty'))
            : ListView.builder(
                itemCount: DummyLists.lab.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(DummyLists.lab[index]['prescription']),
                        trailing: Container(
                          child: const Text('waiting'),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }));
  }
}
