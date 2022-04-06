import 'package:flutter/material.dart';
import 'package:heartbeat/constants/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/image_view_screen.dart';
import 'package:provider/provider.dart';
// import 'package:heartbeat/models/dummy_lists.dart';

class LabtestsResults extends StatelessWidget {
  const LabtestsResults({Key? key}) : super(key: key);

  static const String routeName = 'Lab test results ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labtests results'),
      ),
      body: FutureBuilder(
        future: Provider.of<DBHelper>(context).getResults(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snap.hasData) {
            return Center(
              child: Text('something went wrong'),
            );
          } else if ((snap.data as dynamic)[0]['message'] == 'null') {
            return Center(
              child: Text('No data'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: ListView.builder(
                  itemCount: (snap.data as List).length,
                  itemBuilder: (context, index) {
                    return (snap.data as dynamic)[index]['result'] == ''
                        ? Container()
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ImageViewScreen.routeName,
                                      arguments: Provider.of<DBHelper>(context,
                                                  listen: false)
                                              .urlsForLabResultImage +
                                          (snap.data as dynamic)[index]
                                              ['result']);

                                  print('tap');
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      Provider.of<DBHelper>(context)
                                              .urlsForLabResultImage +
                                          (snap.data as dynamic)[index]
                                              ['result']),
                                ),
                                title:
                                    Text((snap.data as dynamic)[index]['test']),
                                // subtitle: Text(DateFormat('dd/MM/yyyy')
                                //     .format(imagePresc[index]['date'])),
                                // trailing: Text(
                                //     DateFormat('h:m').format(imagePresc[index]['date'])),
                              ),
                              Divider(),
                            ],
                          );
                  }),
            );
          }
        },
      ),
    );
  }
}
