import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:heartbeat/screens/patient_home_page.dart';
import 'package:provider/provider.dart';

class PayemntScreen extends StatelessWidget {
  const PayemntScreen({Key? key}) : super(key: key);

  static String routeName = 'payment screen';

  @override
  Widget build(BuildContext context) {
    final itemsList = Provider.of<DBHelper>(context).paymentProfile;
    var gTotal = 0.0;
    double grandTotal() {
      for (var i = 0; i < itemsList.length; i++) {
        gTotal = gTotal + (itemsList[i]['price'] as double);
      }
      return gTotal;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Billing'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            DummyLists.kart.clear();
            DummyLists.lab.clear();
            Provider.of<DBHelper>(context, listen: false)
                .paymentProfile
                .clear();
            itemsList.clear();

            Navigator.of(context).pushNamed(PatientHomePage.routeName);
          },
          child: Icon(Icons.credit_card),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text((itemsList[index]['item'] as String) +
                          ' x' +
                          itemsList[index]['count'].toString()),
                      trailing: Text(
                          (itemsList[index]['price'] as double).toString()),
                    );
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Grand Total'),
                  Text(
                    grandTotal().toString(),
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
