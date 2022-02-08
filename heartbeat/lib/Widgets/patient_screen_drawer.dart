import 'package:flutter/material.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/cart_screen.dart';
import 'package:heartbeat/screens/labtest_booking_screen.dart';
// import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_profile_edit_screen.dart';
import 'package:heartbeat/screens/patients_appoinments.dart';
import 'package:provider/provider.dart';

class PatientScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
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
              Navigator.of(context).pop();
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
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            title: Text('Cart'),
            trailing: Icon(Icons.shopping_cart),
          ),
          Divider(),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(LabtestBookingScreen.routeName),
            title: Text('Labtest Booking'),
            trailing: Icon(Icons.biotech),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(PatientsAppoinments.routeName);
            },
            title: Text('Appoinments'),
            trailing: Icon(Icons.event),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Provider.of<DBHelper>(context, listen: false).logout(context);
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
