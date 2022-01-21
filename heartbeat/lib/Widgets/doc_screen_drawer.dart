import 'package:flutter/material.dart';

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
            title: Text('Doc Profile'),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                )),
          ),
          Divider(),
          ListTile(
            title: Text('Appoinments'),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.today,
                )),
          ),
          Divider(),
          ListTile(
            title: Text('Apply for Leave'),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.pending_actions,
                )),
          )
        ],
      ),
    );
  }
}
