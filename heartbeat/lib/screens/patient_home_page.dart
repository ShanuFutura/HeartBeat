import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/image_file_input_dialog.dart';
import 'package:heartbeat/Widgets/patient_presc_listview.dart';
import 'package:heartbeat/Widgets/patient_screen_drawer.dart';
import 'package:heartbeat/models/carousel_images.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/cart_screen.dart';

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
  refresh() {
    setState(() {});
  }

  final picker = ImagePicker();
  var initialFileName = '';
  final txtctrl = TextEditingController();

  File? _storedImage;
  File? savedImage;

  Future<void> _takePicture(BuildContext context) async {
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

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return imageFileInputDialog(savedImage);
        });

    print(DummyLists.oldPrescImages.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          child: Text('Upload '),
        ),
        onPressed: () {
          _takePicture(context);
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
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ListView.builder(
                              itemCount: DummyLists.docsList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushNamed(
                                            DoctorView.routeName,
                                            arguments: index);
                                      },
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(DummyLists.docsList[index]
                                              ['doc_name'] as String),
                                          Text(DummyLists.docsList[index]
                                              ['department'] as String)
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                );
                              }),
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Search Docs'),
                      Icon((Icons.search)),
                    ],
                  ),
                ),
              )),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Stack(alignment: Alignment.topRight, children: [
              Icon(Icons.shopping_cart),
              if (!DummyLists.kart.isEmpty)
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 6,
                  child: Text(
                    DummyLists.kart.length.toString(),
                    style: TextStyle(fontSize: 8),
                  ),
                ),
            ]),
          ),
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
              child: PatientPrescListView(
                notifyParent: refresh,
                isDoc: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
