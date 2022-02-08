import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/image_view_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PatientPrescListView extends StatefulWidget {
  final Function() notifyParent;
  final bool isDoc;
  const PatientPrescListView(
      {Key? key, required this.notifyParent, required this.isDoc})
      : super(key: key);

  @override
  State<PatientPrescListView> createState() => _PatientPrescListViewState();
}

class _PatientPrescListViewState extends State<PatientPrescListView> {
  @override
  Widget build(BuildContext context) {
    final dummyPrescsList = (Provider.of<DBHelper>(context).dummyPrescs)
        .where((element) =>
            widget.isDoc ? element['presc_type'] == 'medicine' : true)
        .toList();
    // final dummyPrescsList=
    //HERE FILTER PRESC LIST AS MEDICINE AND TEST FOR EACH VIEW

// final

    final todaysList = dummyPrescsList.where((element) {
      final date = DateFormat('ddmmyy').format(element['date'] as DateTime);
      return (date == DateFormat('ddmmyy').format(DateTime.now()));
    }).toList();

    final todays_1_List = dummyPrescsList.where((element) {
      final date = element['date'] as DateTime;
      return date.isBefore(DateTime.now().subtract(Duration(days: 1))) &&
          date.isAfter(DateTime.now().subtract(Duration(days: 2)));
    }).toList();

    final olderList = dummyPrescsList.where((element) {
      final date = element['date'] as DateTime;
      return date.isBefore(DateTime.now().subtract(Duration(days: 2)));
    }).toList();

    prescCard(int index) {
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
                                .format(DummyLists.dummyPrescs[index]['date']
                                    as DateTime)
                                .toString()),
                            Text('Dr. ' +
                                DummyLists.dummyPrescs[index]['doctor_name']
                                    .toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 30),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(DummyLists.dummyPrescs[index]
                                        ['prescription']
                                    .toString()),
                              ),
                              Text(' x' +
                                  DummyLists.dummyPrescs[index]['count']
                                      .toString()),
                              if (!widget.isDoc)
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
                                            print(
                                                DummyLists.dummyPrescs[index]);
                                            Fluttertoast.showToast(
                                                msg: DummyLists.dummyPrescs[
                                                                index]
                                                            ['presc_type'] !=
                                                        'medicine'
                                                    ? 'item added to lab'
                                                    : 'item added to cart');
                                            widget.notifyParent();
                                            DummyLists.dummyPrescs[index]
                                                        ['presc_type'] ==
                                                    'test'
                                                ? DummyLists.lab.add(DummyLists
                                                    .dummyPrescs[index])
                                                : DummyLists.kart.add(DummyLists
                                                    .dummyPrescs[index]);
                                          },
                                          icon: Icon(
                                              DummyLists.dummyPrescs[index]
                                                          ['presc_type'] ==
                                                      'test'
                                                  ? Icons.biotech
                                                  : Icons.shopping_cart)),
                                    ])),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return ListView(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text('Today'),
          children: [
            ListView.builder(
              itemCount: todaysList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    prescCard(
                        DummyLists.dummyPrescs.indexOf(todaysList[index]));
                  },
                  title: Row(
                    children: [
                      Text(todaysList[index]['prescription']),
                      Text(' x' + todaysList[index]['count']),
                    ],
                  ),
                  trailing: Text('Dr. ' + todaysList[index]['doctor_name']),
                );
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text('yesterday'),
          children: [
            ListView.builder(
              itemCount: todays_1_List.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    print(DummyLists.dummyPrescs.indexOf(todays_1_List[index]));
                    prescCard(
                        DummyLists.dummyPrescs.indexOf(todays_1_List[index]));
                  },
                  title: Row(
                    children: [
                      Text(todays_1_List[index]['prescription']),
                      Text(todays_1_List[index]['presc_type'] == 'medicine'
                          ? ' x' + todays_1_List[index]['count']
                          : ''),
                    ],
                  ),
                  trailing: Text('Dr. ' + todays_1_List[index]['doctor_name']),
                );
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text('Older'),
          children: [
            ListView.builder(
              itemCount: olderList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    prescCard(DummyLists.dummyPrescs.indexOf(olderList[index]));
                  },
                  title: Row(
                    children: [
                      Text(olderList[index]['prescription']),
                      Text(olderList[index]['presc_type'] == 'medicine'
                          ? ' x' + olderList[index]['count']
                          : ''),
                    ],
                  ),
                  trailing: Text('Dr. ' + olderList[index]['doctor_name']),
                  subtitle: Text(DateFormat('dd/MM/yyyy')
                      .format(olderList[index]['date'])),
                );
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text('Uploaded prescriptions'),
          children: [
            ListView.builder(
              itemCount: DummyLists.oldPrescImages.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(ImageViewScreen.routeName,
                        arguments: DummyLists.oldPrescImages[index]['image']);
                    // ImageViewScreen();
                    print('tap');
                  },
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                        DummyLists.oldPrescImages[index]['image'] as File),
                  ),
                  title:
                      Text(DummyLists.oldPrescImages[index]['name'] as String),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
