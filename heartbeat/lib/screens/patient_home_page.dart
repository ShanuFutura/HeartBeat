import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/patient_screen_drawer.dart';
import 'package:heartbeat/models/carousel_images.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/doc_home_page.dart';
import 'package:heartbeat/screens/doctor_view.dart';
// import 'package:flutter_search_bar/flutter_search_bar.dart';

class PatientHomePage extends StatelessWidget {
  // const PatientHomePage({ Key? key }) : super(key: key);

  // PatientHomePage();

  static const String routeName = 'patient home';
  // final SearchBar searchBar = SearchBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          child: Text('Upload '),
        ),
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              // side: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: PatientScreenDrawer(),
      appBar: AppBar(
        // title: const Text(
        //   'Heartbeat',
        //   // style: TextStyle(color: Colors.black),
        // ),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          //
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton(
              // isExpanded: true,
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
