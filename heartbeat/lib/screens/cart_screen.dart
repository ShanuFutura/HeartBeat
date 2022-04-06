import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heartbeat/providers/db_helper.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  static const String routeName = 'cart screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<dynamic> refresh() async {
    setState(() {});
    await Future.delayed(Duration.zero);
    
    return null;
  }

  bool isCartEmpty = true;
  @override
  Widget build(BuildContext context) {
  var grandTotal = 0;
    return Scaffold(
        appBar: AppBar(title: const Text('Your Cart')),
        body: FutureBuilder(
            future: Provider.of<DBHelper>(context).getCartItems(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No data'),
                );
              } else if ((snapshot.data as List).isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                isCartEmpty = false;
                return RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                      itemCount: (snapshot.data as List).length,
                      itemBuilder: ((context, index) {
                        grandTotal = grandTotal +
                            int.parse((snapshot.data as dynamic)[index]
                                    ['count']) *
                                int.parse(
                                    (snapshot.data as dynamic)[index]['price']);
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                (snapshot.data as dynamic)[index]['medicine'],
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      '${(snapshot.data as dynamic)[index]['count']} x ${(snapshot.data as dynamic)[index]['price']} = '),
                                  Text(
                                    (int.parse((snapshot.data as dynamic)[index]
                                                ['count']) *
                                            int.parse((snapshot.data
                                                as dynamic)[index]['price']))
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      })),
                );
              }
            })),
        floatingActionButton: InkWell(
            onTap: () {
              if (isCartEmpty) {
                Fluttertoast.showToast(msg: 'Theres nothing in your cart');
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                            child:
                                Text('Grand total ' + grandTotal.toString())),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<DBHelper>(context, listen: false)
                                    .checkout();
                                setState(() {});
                              },
                              child: Text('proceed'))
                        ],
                      );
                    });
              }
            },
            child: const Chip(
              backgroundColor: Colors.blue,
              label: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
        // ElevatedButton(onPressed: () {}, child: Text('Checkout')),
        );
  }
}
