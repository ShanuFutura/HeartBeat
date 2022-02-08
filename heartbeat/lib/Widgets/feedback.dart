import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared';

class FeedbackText extends StatefulWidget {
  const FeedbackText({Key? key}) : super(key: key);

  @override
  _FeedbackTextState createState() => _FeedbackTextState();
}

var feedbackText = '';
// final prefs = SharedPreferences;

class _FeedbackTextState extends State<FeedbackText> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0),
      child: Card(
        child: Wrap(
          alignment: WrapAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                initialValue: feedbackText,
                onChanged: (value) {
                  setState(() {
                    feedbackText = value;
                  });
                },
                decoration:
                    const InputDecoration(hintText: 'Drop your Feedback'),
                maxLines: 10,
              ),
            ),
            IconButton(
                onPressed: feedbackText.trim().isEmpty
                    ? null
                    : () {
                        Provider.of<DBHelper>(context, listen: false)
                            .feedBackCall(feedbackText);
                        Fluttertoast.showToast(
                            msg: 'feedback sent', gravity: ToastGravity.CENTER);
                        Navigator.of(context).pop();

                        // print(feedbackText);
                        feedbackText = '';
                      },
                icon: const Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
