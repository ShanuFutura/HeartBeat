import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/carousel.dart';
import 'package:heartbeat/Widgets/doc_screen_drawer.dart';
import 'package:heartbeat/models/carousel_images.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
// import 'package:heartbeat/models/patient_lists.dart';
import 'package:heartbeat/screens/patient_view.dart';
import 'package:provider/provider.dart';

class DocHomePage extends StatelessWidget {
  static const routeName = 'dec home page';
  // const DocHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DocScreenDrawer(),
      appBar: AppBar(
        title: Text('HeartBeat'),
        // leading: IconButton(
        //   onPressed: () {
        //     DocScreenDrawer();
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //     child: TextButton(
        //       onPressed: () {},
        //       child: const Text(
        //         'Appoinments',
        //         style: TextStyle(color: Colors.white, fontSize: 20),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(),
            Carousel(CarouselImages.itemsList, partHeight: fullHeight * .5),
            const SizedBox(height: 10),
            const Text(
              'Patients',
              style: TextStyle(fontSize: 20),
            ),
            FutureBuilder(
                future: Provider.of<DBHelper>(context).appointmentPatients(),
                builder: (context, snap) {
                  // print(snap.data);
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if ((snap.data as dynamic)[0]['message'] !=
                      'Failed to View') {
                    // final patientsList = DummyLists.patientsList;
                    // print(patientsList);
                    // print(snap.data);
                    return Container(
                      height: fullHeight * .4,
                      child: ListView.builder(
                          itemCount: (snap.data as List).length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const CircleAvatar(),
                              title: Text(
                                  (snap.data as List)[index]['patient_name']!),
                              subtitle:
                                  Text((snap.data as List)[index]['age']!),
                              trailing: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        PatientView.routeName,
                                        arguments: (snap.data as List)[index][
                                            'id']); // patient name should replace with unique id
                                  },
                                  child: const Text('View')),
                            );

                            // patientsList[index];
                          }),
                    );
                  } else {
                    return Container(
                      height: fullHeight * .4,
                      child: Center(
                        child: Text('Something went wrong'),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
