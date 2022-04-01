import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/constants/dummy_lists.dart';
// import 'package:heartbeat/models/dummy_lists.dart';
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
    refresh() {
      setState(() {});
    }

    final imagePresc = Provider.of<DBHelper>(context).imagePresc;
    final dummyPrescsList = Provider.of<DBHelper>(context).dummyPrescs;

    final todaysList = dummyPrescsList.where((element) {
      final date =
          DateFormat('ddMMyyyy').format(DateTime.parse(element['date']));
      return date == DateFormat('ddMMyyyy').format(DateTime.now());
    }).toList();

    final todays_1_List = dummyPrescsList.where((element) {
      final date =
          DateFormat('ddMMyyyy').format(DateTime.parse(element['date']));
      return date ==
          DateFormat('ddMMyyyy')
              .format(DateTime.now().subtract(Duration(days: 1)));
    }).toList();

    final olderList = dummyPrescsList.where((element) {
      final date = DateTime.parse(
          DateFormat('ddMMyyy').format(DateTime.parse(element['date'])));
      return date.isBefore(DateTime.parse(DateFormat('ddMMyyyy')
          .format(DateTime.now().subtract(Duration(days: 1)))));
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
                                .format(DateTime.parse(
                                        DummyLists.dummyPrescs[index]['date'])
                                    as DateTime)
                                .toString()),
                            Text('Dr. ' +
                                DummyLists.dummyPrescs[index]['doctor']
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
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(DummyLists.dummyPrescs[index]
                                        ['name']
                                    .toString()),
                              ),
                              if (DummyLists.dummyPrescs[index]['type'] ==
                                  'medicine')
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
                                            // final price = Provider.of<DBHelper>(
                                            //         context,
                                            //         listen: false)
                                            //     .getPrices('item');
                                            // Provider.of<DBHelper>(context,
                                            //         listen: false)
                                            //     .paymentProfile
                                            //     .add({
                                            //   'item':
                                            //       DummyLists.dummyPrescs[index]
                                            //           ['name'] as String,
                                            //   'count':
                                            //       DummyLists.dummyPrescs[index]
                                            //           ['count'] as int,
                                            //   'price': price *
                                            //       (DummyLists.dummyPrescs[index]
                                            //           ['count'] as int)
                                            // });

                                            // if (DummyLists.dummyPrescs[index]
                                            //         ['presc_type'] ==
                                            //     'test') {
                                            //   Fluttertoast.showToast(
                                            //       msg: 'item added to lab');
                                            //   DummyLists.lab.add(DummyLists
                                            //       .dummyPrescs[index]);
                                            // } else {
                                            //   Fluttertoast.showToast(
                                            //       msg: 'item added to cart');
                                            //   DummyLists.kart.add(DummyLists
                                            //       .dummyPrescs[index]);
                                            // }
                                            // print(
                                            //     DummyLists.dummyPrescs[index]);
                                            // widget.notifyParent();
                                          },
                                          icon: Icon(
                                              DummyLists.dummyPrescs[index]
                                                          ['type'] ==
                                                      'test'
                                                  ? Icons.book_online
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

    if (dummyPrescsList.isEmpty) {
      return Center(
        child: Text('no data'),
      );
    } else
      return ListView(
        shrinkWrap: true,
        children: [
          ExpansionTile(
            title: const Text('Today'),
            children: [
              ListView.builder(
                itemCount: todaysList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      prescCard(
                          DummyLists.dummyPrescs.indexOf(todaysList[index]));
                    },
                    title: Row(
                      children: [
                        Text(todaysList[index]['name']),
                        Text(todaysList[index]['type'] == 'medicine'
                            ? ' x' + todaysList[index]['count'].toString()
                            : ''),
                      ],
                    ),
                    trailing: Text('Dr. ' + todaysList[index]['doctor']),
                    subtitle: Text(DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(todaysList[index]['date']))),
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
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      print(
                          DummyLists.dummyPrescs.indexOf(todays_1_List[index]));
                      prescCard(
                          DummyLists.dummyPrescs.indexOf(todays_1_List[index]));
                    },
                    title: Row(
                      children: [
                        Text(todays_1_List[index]['name']),
                        Text(todays_1_List[index]['type'] == 'medicine'
                            ? ' x' + todays_1_List[index]['count'].toString()
                            : ''),
                      ],
                    ),
                    trailing: Text('Dr. ' + todays_1_List[index]['doctor']),
                    subtitle: Text(DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(todays_1_List[index]['date']))),
                  );
                },
              )
            ],
          ),
          ExpansionTile(
            title: const Text('Older'),
            children: [
              ListView.builder(
                itemCount: olderList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      prescCard(
                          DummyLists.dummyPrescs.indexOf(olderList[index]));
                    },
                    title: Row(
                      children: [
                        Text(olderList[index]['name']),
                        Text(olderList[index]['type'] == 'medicine'
                            ? ' x' + olderList[index]['count'].toString()
                            : ''),
                      ],
                    ),
                    trailing: Text('Dr. ' + olderList[index]['doctor']),
                    subtitle: Text(DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(olderList[index]['date']))),
                  );
                },
              )
            ],
          ),
          ExpansionTile(
            title: const Text('Uploaded prescriptions'),
            children: [
              ListView.builder(
                itemCount: imagePresc.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(ImageViewScreen.routeName,
                          arguments: imagePresc[index]['image']);

                      print('tap');
                    },
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(imagePresc[index]['image'] as File),
                    ),
                    title: Text(imagePresc[index]['name'] as String),
                    subtitle: Text(DateFormat('dd/MM/yyyy')
                        .format(imagePresc[index]['date'])),
                    trailing: Text(
                        DateFormat('h:m').format(imagePresc[index]['date'])),
                  );
                },
              )
            ],
          ),
        ],
      );
  }
}
