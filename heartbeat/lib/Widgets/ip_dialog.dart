import 'package:flutter/material.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class IPDialog extends StatelessWidget {
  IPDialog({Key? key}) : super(key: key);
  final cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            child: TextField(
              controller: cont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('ip'),
                  hintText: 'Eg: 192.168.1.5'),
            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<DBHelper>(context).urlS =
                    'http://' + cont.text.trim() + '/Doctor_Patient/api/';
              },
              icon: Icon(Icons.done))
        ],
      ),
    );
  }
}
