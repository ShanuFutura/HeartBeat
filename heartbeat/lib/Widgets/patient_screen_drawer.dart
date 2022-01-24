import 'package:flutter/material.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_profile_edit_screen.dart';

class PatientScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Theme.of(context).colorScheme.primary,
            //     Theme.of(context).canvasColor,
            //   ],
            // ),
            // ),
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Patient Name',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          ListTile(
            title: Text('Patient Profile'),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(PatientProfilEditScreen.routeName);
                },
                icon: Icon(
                  Icons.account_circle,
                )),
          ),
          Divider(),
          ListTile(
            title: Text('Payments'),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.paid,
                )),
          ),
          Divider(),
          ListTile(
            title: Text('Cart'),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
    );
  }
}
