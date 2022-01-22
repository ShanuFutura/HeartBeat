import 'package:flutter/material.dart';

class DoctorView extends StatelessWidget {
  // const DoctorView({ Key? key }) : super(key: key);

  static const String routeName = 'docview';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // shadowColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    // color: Colors.amber,
                    width: 250,
                    child: Text(arg, style: TextStyle(fontSize: 50))),
                Text(
                  'status',
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Feedback',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Book Appoinments',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: () {}, child: Text('feedback')),
                // ElevatedButton(onPressed: () {}, child: Text('book Doc')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
