import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:intl/intl.dart';

class PatientPrescListView extends StatefulWidget {
  final Function() notifyParent;
  const PatientPrescListView({Key? key, required this.notifyParent})
      : super(key: key);

  @override
  State<PatientPrescListView> createState() => _PatientPrescListViewState();
}

class _PatientPrescListViewState extends State<PatientPrescListView> {
  @override
  Widget build(BuildContext context) {
    void prescCard(int index) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.black.withOpacity(0),
              child: Card(
                child: Container(
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(DateFormat('dd.MM.yyyy')
                                .format(DummyLists.newMedPrescList[index].date)
                                .toString()),
                            Text('Dr. ' +
                                DummyLists.newMedPrescList[index].docName),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 90, 10, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(DummyLists
                                  .newMedPrescList[index].medicine
                                  .toString()),
                            ),
                            Expanded(
                              child: Text(' x' +
                                  DummyLists.newMedPrescList[index].quantity
                                      .toString()),
                            ),
                            Expanded(
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                  const Icon(
                                    Icons.add_circle,
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: 'item added to cart');
                                        widget.notifyParent();
                                        DummyLists.kart.add(
                                            DummyLists.newMedPrescList[index]);
                                        // setState(() {
                                        // });
                                      },
                                      icon: Icon(Icons.shopping_cart)),
                                ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: DummyLists.newMedPrescList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  prescCard(index);
                },
                title: Text(
                  DateFormat('dd/mm/yyyy')
                      .format(DummyLists.newMedPrescList[index].date),
                ),
              ),
              Divider()
            ],
          );
        });
  }
}
