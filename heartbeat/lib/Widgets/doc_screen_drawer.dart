import 'package:flutter/material.dart';

class DocScreenDrawer extends StatelessWidget {
  // const DocScreenDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Drawer(
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
                'XXX',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Divider(),
            ListTile(
              title: Text('Doc Profile'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_circle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
