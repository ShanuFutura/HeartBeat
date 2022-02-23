import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
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
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate!.toIso8601String());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: DummyLists.appliedLeaves.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(DummyLists.appliedLeaves[index]['date'].toString()),
              trailing:
                  Text(DummyLists.appliedLeaves[index]['approval'].toString()),
            );
          }),
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
                      DummyLists.appliedLeaves
                          .add({'date': selectedDate!, 'approval': 'waiting'});
                      final slDate =
                          DateFormat('DD/MM/yyyy').format(selectedDate!);
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
            child: Icon(isApply ? Icons.send : Icons.edit),
          ),
        ],
      ),
    );
  }
}
