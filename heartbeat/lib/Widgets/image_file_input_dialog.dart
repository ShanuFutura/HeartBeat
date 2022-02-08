import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class imageFileInputDialog extends StatefulWidget {
  final File savedImage;
  imageFileInputDialog(this.savedImage);

  @override
  State<imageFileInputDialog> createState() => _imageFileInputDialogState();
}

var initialFileName = '';

class _imageFileInputDialogState extends State<imageFileInputDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: '',
                // controller: txtctrl,
                onChanged: (v) {
                  setState(() {
                    initialFileName = v;
                  });
                },
              ),
              ElevatedButton(
                onPressed: initialFileName.isEmpty
                    ? null
                    : () {
                        Provider.of<DBHelper>(context, listen: false)
                            .addImagePresc(widget.savedImage, DateTime.now(),
                                initialFileName);
                        // setState(() {
                        //   DummyLists.oldPrescImages.add(
                        //     {
                        //       'image': widget.savedImage,
                        //       'date': DateTime.now(),
                        //       'name': initialFileName,
                        //     },
                        //   );
                        // });
                        Navigator.of(context).pop();
                      },
                child: const Text('Add Name'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
