import 'package:flutter/material.dart';
// import 'package:heartbeat/helpers/db_helper.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/cart_screen.dart';
import 'package:heartbeat/screens/labtest_booking_screen.dart';
// import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:heartbeat/screens/patient_profile_edit_screen.dart';
import 'package:heartbeat/screens/patients_appoinments.dart';
import 'package:heartbeat/screens/payment_screen.dart';
import 'package:provider/provider.dart';

class PatientScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
                // decoration: BoxDecoration(border: Border.all()),
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Center(child: Image.asset('assets/heart_gif.gif'))),
            // const SizedBox(
            //   height: 20,
            // ),
            const Divider(),
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
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: const Text('Cart'),
              trailing: const Icon(Icons.shopping_cart),
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.of(context)
                  .pushNamed(LabtestBookingScreen.routeName),
              title: const Text('Labtest Booking'),
              trailing: const Icon(Icons.biotech),
            ),
            const Divider(),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(PayemntScreen.routeName),
              title: const Text('Payments'),
              trailing: const Icon(Icons.monetization_on_outlined),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(PatientsAppoinments.routeName);
              },
              title: const Text('Appoinments'),
              trailing: const Icon(Icons.event),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Provider.of<DBHelper>(context, listen: false).logout(context);
              },
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
