import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/feedback.dart';
// import 'package:heartbeat/Widgets/patient_presc_listview.dart';
import 'package:heartbeat/Widgets/time_slot_card.dart';
import 'package:heartbeat/constants/dummy_lists.dart';
// import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class DoctorView extends StatefulWidget {
  static const String routeName = 'docview';

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  notifyParent() {}

  var isDocThere = '';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as int;
    final docId = DummyLists.docsList[arg]['doctor_id'];
    final docName = DummyLists.docsList[arg]['doc_name'] as String;

    // final appoinmentsCount =
    //     Provider.of<DBHelper>(context).availableTimeSlotsCount(docName);
    // var feedbackText = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            docName,
                            style: const TextStyle(fontSize: 40),
                          ),
                          Text(DummyLists.docsList[arg]['qualification']
                              as String)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FutureBuilder(
                            future: Provider.of<DBHelper>(context)
                                .isDocAvailable(2),
                            builder: (context, snap) {
                              if (snap.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('loading...');
                              } else {
                                print(snap.data);
                                return Text(snap.data.toString());
                              }
                            }), //Text(isDocThere),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                            future: Provider.of<DBHelper>(context)
                                .availableTimeSlotsCount(int.parse(docId)),
                            builder: (context, snap) {
                              if (snap.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('loading...');
                              } else {
                                return Text(snap.data as int > 1
                                    ? snap.data.toString() + ' slots left'
                                    : snap.data.toString() + ' slot left');
                              }
                            }),
                        // Text(appoinmentsCount.toString() + ' Appoinments left'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Prescriptions by ' + (docName)),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      height: 300,
                      // child: PatientPrescListView(
                      //   notifyParent: notifyParent,
                      //   isDoc: false,
                      // ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<DBHelper>(context, listen: false)
                            .isDocAvailable(2);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const FeedbackText();
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.amber,
                          ),
                          height: 200,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Feedback',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: Provider.of<DBHelper>(context)
                            .availableTimeSlotsCount(int.parse(docId)),
                        builder: (ctx, snap) {
                          if (snap.connectionState == ConnectionState.waiting) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.grey),
                                height: 200,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'loading...',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: DummyLists.docTimeSlots.isEmpty
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 60,
                                                  horizontal: 20,
                                                ),
                                                child: TimeSlotCard(
                                                  doc: docId,
                                                ),
                                              ),
                                            );
                                          });
                                    },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: DummyLists.docTimeSlots.isEmpty
                                        ? Colors.grey
                                        : Colors.blue,
                                  ),
                                  height: 200,
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Book Appoinments',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
