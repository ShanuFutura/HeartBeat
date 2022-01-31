import 'package:flutter/material.dart';

class LaodingScreen extends StatelessWidget {
  const LaodingScreen({Key? key}) : super(key: key);

  static String routeName = 'laoding scren';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
