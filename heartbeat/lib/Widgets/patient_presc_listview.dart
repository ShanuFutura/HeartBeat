import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';

class PatientPrescListView extends StatelessWidget {
  const PatientPrescListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: DummyLists.prescriptionsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.black.withOpacity(0),
                          child: Card(
                            child: Container(
                              child: Wrap(
                                alignment: WrapAlignment.spaceAround,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('date'),
                                        Text('docName'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 90, 10, 30),
                                    child: Text(DummyLists
                                        .prescriptionsList[index]['contents']
                                        .toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                title: Text(
                    DummyLists.prescriptionsList[index]['PrescriptionId']!),
              ),
              Divider()
            ],
          );
        });
  }
}
