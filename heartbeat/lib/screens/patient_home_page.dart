import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/patient_presc_listview.dart';
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
    setState(() {
      DummyLists.oldPrescImages.add(savedImage);
    });
    print(DummyLists.oldPrescImages.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ListView.builder(
                              itemCount: DummyLists.docsList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        DoctorView.routeName,
                                        arguments: DummyLists.docsList[index]);
                                  },
                                  title: Text(DummyLists.docsList[index]),
                                );
                              }),
                        );
                      });
                },
                child: Row(
                  children: [
                    Text('Search Docs'),
                    Icon((Icons.search)),
                  ],
                ),
              )
              // DropdownButton(
              //   underline: Container(),
              //   icon: const Icon(
              //     Icons.search,
              //     color: Colors.black,
              //   ),
              //   items: [
              //     ...DummyLists.docsList
              //         .map((e) => DropdownMenuItem(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     child: Text(e),z
              //                   ),
              //                   Divider(),
              //                 ],
              //               ),
              //               value: e,
              //             ))
              //         .toList(),
              //   ],
              //   onChanged: (v) {
              //     Navigator.of(context)
              //         .pushNamed(DoctorView.routeName, arguments: v);
              //   },
              // ),
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
              child: ListView(
                children: [
                  PatientPrescListView(),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: DummyLists.oldPrescImages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              DummyLists.oldPrescImages[index],
                              // fit: BoxFit.cover,
                            ),
                          ),
                          title: Text('file'),
                          // onTap: ,
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
