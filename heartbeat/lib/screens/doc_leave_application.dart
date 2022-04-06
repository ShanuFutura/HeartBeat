import 'package:flutter/material.dart';

import 'package:heartbeat/providers/db_helper.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DocLeaveApplication extends StatefulWidget {
  const DocLeaveApplication({Key? key}) : super(key: key);

  static String routeName = 'leave app';
  @override
  State<DocLeaveApplication> createState() => _DocLeaveApplicationState();
}

DateTime? selectedDate = null;
bool isApply = false;

class _DocLeaveApplicationState extends State<DocLeaveApplication> {
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 28)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate!.toIso8601String());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave application'),
      ),
      body: FutureBuilder(
        future: Provider.of<DBHelper>(context).getLeaveStatus(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snap.hasData) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if ((snap.data as dynamic)['message'] == 'Failed to View') {
            return const Center(
              child: Text('No data'),
            );
          } else {
            return ListTile(
              title: Text((snap.data as dynamic)['date']),
              subtitle: Text((snap.data as dynamic)['status'] == 0
                  ? 'pending'
                  : (snap.data as dynamic)['status'] == 0
                      ? 'accepted'
                      : 'rejected'),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isApply)
            FloatingActionButton(
              onPressed: () {
                _selectDate(context);
              },
              child: selectedDate == null
                  ? Icon(Icons.event)
                  : Text(DateFormat('dd/MM').format(selectedDate!)),
            ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: isApply
                ? () {
                    if (selectedDate == null) {
                      setState(() {
                        isApply = false;
                      });
                      Fluttertoast.showToast(msg: 'No date selected');
                    } else {
                      final slDate =
                          DateFormat('yyyy-MM-dd').format(selectedDate!);
                      Provider.of<DBHelper>(context, listen: false)
                          .applyLeave(slDate);
                      Fluttertoast.showToast(msg: 'leave applied for  $slDate');
                      setState(() {
                        isApply = false;
                        selectedDate = null;
                      });
                    }
                  }
                : () {
                    setState(() {
                      isApply = true;
                    });
                  },
            child: Icon(isApply ? Icons.send : Icons.add),
          ),
        ],
      ),
    );
  }
}
