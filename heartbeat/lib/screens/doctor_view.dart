import 'package:flutter/material.dart';
import 'package:heartbeat/Widgets/feedback.dart';
import 'package:heartbeat/Widgets/patient_presc_listview.dart';
import 'package:heartbeat/Widgets/time_slot_card.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class DoctorView extends StatelessWidget {
  static const String routeName = 'docview';
  notifyParent() {}

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as int;
    final docName = DummyLists.docsList[arg]['doc_name'] as String;
    final isDocThere =
        Provider.of<DBHelper>(context, listen: false).isDocAvailable(1);

    final appoinmentsCount =
        Provider.of<DBHelper>(context).availableTimeSlotsCount(docName);
    var feedbackText = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
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
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                            DummyLists.docsList[arg]['qualification'] as String)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(isDocThere ? 'Doc Available' : 'Doc on Leave'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(appoinmentsCount.toString() + ' Appoinments left'),
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
                    child: PatientPrescListView(
                      notifyParent: notifyParent,
                      isDoc: false,
                    )),
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FeedbackText();
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: DummyLists.docTimeSlots.isEmpty
                        ? null
                        : () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 60,
                                        horizontal: 20,
                                      ),
                                      child: TimeSlotCard(
                                        doc: docName,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Book Appoinments',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
