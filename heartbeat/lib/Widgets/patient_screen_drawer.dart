import 'package:flutter/material.dart';
import 'package:heartbeat/helpers/db_helper.dart';
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
            onTap: () {
              Navigator.of(context)
                  .pushNamed(PatientProfilEditScreen.routeName);
            },
            title: const Text('Patient Profile'),
            trailing: const Icon(
              Icons.account_circle,
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: const Text('Payments'),
            trailing: Icon(
              Icons.paid,
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text('Cart'),
            trailing: Icon(Icons.shopping_cart),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text('Labtest Booking'),
            trailing: Icon(Icons.biotech),
          ),
          Divider(),
          ListTile(
            onTap: () {
              DBHelper.logout(context);
            },
            title: const Text('Logout'),
            trailing: Icon(Icons.logout),
          ),
          Divider(),
        ],
      ),
    );
  }
}
