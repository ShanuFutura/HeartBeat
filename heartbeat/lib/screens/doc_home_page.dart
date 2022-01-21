import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/doc_screen_drawer.dart';
import 'package:heartbeat/models/carousel_images.dart';
import 'package:heartbeat/models/patient_lists.dart';

class DocHomePage extends StatelessWidget {
  static const routeName = 'dec home page';
  // const DocHomePage({ Key? key }) : super(key: key);

  final patientsList = PatientLists.patients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DocScreenDrawer(),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     DocScreenDrawer();
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Appoinments',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Carousel(CarouselImages.itemsList),
            SizedBox(height: 10),
            Text(
              'Patients',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                  itemCount: patientsList.length,
                  itemBuilder: (context, index) {
                    return patientsList[index];
                  }),
            )
          ],
        ),
      ),
    );
  }
}
