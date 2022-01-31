import 'package:flutter/material.dart';
import 'package:heartbeat/helpers/db_helper.dart';
import 'package:heartbeat/screens/doc_profile_edit%20_screen.dart';

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
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              'DocName',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(DocProfileeditScreen.routeName);
              },
              title: Text('Doc Profile'),
              trailing: Icon(
                Icons.account_circle,
              )),

          Divider(),

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
              onTap: () {},
              title: Text('Apply for Leave'),
              trailing: Icon(
                Icons.pending_actions,
              )),

          Divider(),
          ListTile(
              onTap: () {
                DBHelper.logout(context);
              },
              title: Text('Logout'),
              trailing: Icon(
                Icons.logout,
              )),

          Divider(),
        ],
      ),
    );
  }
}
