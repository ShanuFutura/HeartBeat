import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/patient_screen_drawer.dart';
import 'package:heartbeat/models/carousel_images.dart';
import 'package:heartbeat/models/dummy_lists.dart';
// import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doctor_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PatientHomePage extends StatefulWidget {
  static const String routeName = 'patient home';

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  final picker = ImagePicker();

  File? _storedImage;
  File? savedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();

    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) return;
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await getApplicationDocumentsDirectory();

    final fileName = basename(imageFile.path);

    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          child: Text('Upload '),
        ),
        onPressed: () {
          _takePicture();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: PatientScreenDrawer(),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton(
              underline: Container(),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              items: [
                ...DummyLists.docsList
                    .map((e) => DropdownMenuItem(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(e),
                              ),
                              Divider(),
                            ],
                          ),
                          value: e,
                        ))
                    .toList(),
              ],
              onChanged: (v) {
                Navigator.of(context)
                    .pushNamed(DoctorView.routeName, arguments: v);
              },
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Heartbeat',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Carousel(CarouselImages.itemsList),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 300,
              child: ListView.builder(
                  itemCount: DummyLists.prescriptionsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(DummyLists.prescriptionsList[index]
                              ['PrescriptionId']!),
                        ),
                        Divider()
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
