import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/image_file_input_dialog.dart';
import 'package:heartbeat/Widgets/patient_presc_listview.dart';
import 'package:heartbeat/Widgets/patient_screen_drawer.dart';
import 'package:heartbeat/constants/carousel_images.dart';
import 'package:heartbeat/constants/dummy_lists.dart';
// import 'package:heartbeat/models/carousel_images.dart';
// import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/cart_screen.dart';

import 'package:heartbeat/screens/doctor_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

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
  bool isLoading = false;
  Future<void> _takePicture(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    setState(() {
      // isLoading = false;
      _storedImage = File(imageFile.path);
    });
    final appDir = await getApplicationDocumentsDirectory();

    final fileName = basename(imageFile.path);

    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    // Provider.of<DBHelper>(context,listen: false).uploadImagePresc(savedImage,'',DateTime.now());
    Provider.of<DBHelper>(context, listen: false).uploadImagePresc(
      savedImage,
    );
    setState(() {
      isLoading = false;
    });
    // showDialog(
    //     context: context,
    //     builder: (BuildContext ctx) {
    //       return imageFileInputDialog(savedImage);
    //     });

    print(DummyLists.oldPrescImages.toString());
  }

  var fetchResponse;
  @override
  Widget build(BuildContext context) {
    // Provider.of<DBHelper>(context, listen: false)
    //     .fetchAndSetDoctorsList(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ElevatedButton(
        child: const Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          child: Text('Upload '),
        ),
        onPressed: () {
          // Provider.of<DBHelper>(context, listen: false)
          //         .isImagePoppedWithoutName ==
          // true;
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                                ['department_name'] as String)
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                    ],
                                  );
                                }),
                          ),
                        );
                      });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: Provider.of<DBHelper>(context)
                          .fetchAndSetDoctorsList(context),
                      builder: (ctx, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Text('loading...');
                        } else {
                          return Row(
                            children: const [
                              Text('Search Docs'),
                              Icon((Icons.search)),
                            ],
                          );
                        }
                      },
                    )),
              )),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Stack(alignment: Alignment.topRight, children: [
              const Icon(Icons.shopping_cart),
              if (!DummyLists.kart.isEmpty)
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 212, 14, 0),
                  radius: 6,
                  child: Text(
                    DummyLists.kart.length.toString(),
                    style: const TextStyle(fontSize: 8),
                  ),
                ),
            ]),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : fetchResponse == true
              ? Text('connection error')
              : RefreshIndicator(
                  onRefresh: () async {
                    await refresh();
                  },
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(deviceHeight * .012),
                          child: Text(
                            'Heartbeat',
                            style: TextStyle(fontSize: deviceHeight * .05),
                          ),
                        ),
                        Carousel(CarouselImages.itemsList,
                            partHeight: deviceHeight * .31),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: .5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            height: deviceHeight * .46,
                            child: FutureBuilder(
                                future: Provider.of<DBHelper>(context)
                                    .getPrescForPatient(),
                                builder: (context, snap) {
                                  if (snap.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (!snap.hasData) {
                                    return Center(
                                      child: Text('Couldn\'t fetch data'),
                                    );
                                  } else if ((snap.data as dynamic)[0]
                                          ['message'] ==
                                      'failed') {
                                    return Center(
                                      child: Text('No datas'),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: PatientPrescListView(
                                        notifyParent: refresh,
                                        isDoc: false,
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
    );
  }
}
