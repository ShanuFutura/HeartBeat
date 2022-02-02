import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class TimeSlotCard extends StatefulWidget {
  const TimeSlotCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeSlotCard> createState() => _TimeSlotCardState();
}

class _TimeSlotCardState extends State<TimeSlotCard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...DummyLists.docTimeSlots
            .map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<DBHelper>(context, listen: false)
                            .addAppoinment(e);

                        DummyLists.docTimeSlots
                            .removeWhere((element) => element == e);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.blue,
                      ),
                      height: 40,
                      width: 60,
                      child: Center(
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList()
      ],
    );
  }
}
