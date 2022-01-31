import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';

class PatientsAppoinments extends StatelessWidget {
  const PatientsAppoinments({Key? key}) : super(key: key);
  static String routeName = 'patients appoinments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You have appoinment with'),
            ...DummyLists.appoinments.map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(e['doc'].toString()),
                    SizedBox(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.blue,
                      ),
                      height: 40,
                      width: 60,
                      child: Center(
                        child: Text(
                          e['slot'].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
