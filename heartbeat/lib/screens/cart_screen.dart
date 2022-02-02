import 'package:flutter/material.dart';
import 'package:heartbeat/models/dummy_lists.dart';
import 'package:heartbeat/screens/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String routeName = 'cart screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // final refreshCallBack = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: ListView.builder(
          itemCount: DummyLists.kart.length,
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                title: Text(DummyLists.kart[index].medicine),
                trailing:
                    Text('x' + DummyLists.kart[index].quantity.toString()),
              ),
              Divider()
            ]);
          }),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(PayemntScreen.routeName);
          // refreshCallBack;
          setState(() {
            // DummyLists.kart.clear();
          });
        },
        child: Container(
          height: 50,
          width: 150,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'Checkout',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
