import 'package:flutter/material.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = 'cart screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: Provider.of<DBHelper>(context).getCartItems(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if ((snapshot.data as dynamic)['message'] ==
                'Failed to View') {
              return const Center(
                child: Text('No data'),
              );
            }
            {
              return ListView.builder(
                  itemCount: (snapshot.data as List).length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        // title: ,
                        );
                  }));
            }
          })),
    );
  }
}
