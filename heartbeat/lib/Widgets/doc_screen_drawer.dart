import 'package:flutter/material.dart';
import 'package:heartbeat/providers/db_helper.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:heartbeat/screens/doc_leave_application.dart';
import 'package:heartbeat/screens/doc_profile_edit%20_screen.dart';
import 'package:provider/provider.dart';

class DocScreenDrawer extends StatelessWidget {
  // const DocScreenDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).canvasColor,
                ],
              ),
            ),
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              'DocName',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(),
          ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(DocProfileeditScreen.routeName);
              },
              title: const Text('Doc Profile'),
              trailing: const Icon(
                Icons.account_circle,
              )),

          const Divider(),

          // ListTile(
          //   title: Text('Appoinments'),
          //   trailing: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.today,
          //       )),
          // ),
          // Divider(),
          ListTile(
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed(DocLeaveApplication.routeName);
              },
              title: const Text('Apply for Leave'),
              trailing: const Icon(
                Icons.pending_actions,
              )),

          const Divider(),
          ListTile(
              onTap: () {
                Provider.of<DBHelper>(context, listen: false).logout(context);
              },
              title: const Text('Logout'),
              trailing: const Icon(
                Icons.logout,
              )),

          const Divider(),
        ],
      ),
    );
  }
}
