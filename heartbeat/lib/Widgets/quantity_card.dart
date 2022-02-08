import 'package:flutter/material.dart';

class QuantityCard extends StatefulWidget {
  const QuantityCard({
    Key? key,
    required this.medicineQuantity,
    required this.getQuantity,
  }) : super(key: key);
  final Function getQuantity;
  final int medicineQuantity;

  @override
  State<QuantityCard> createState() => _QuantityCardState();
}

class _QuantityCardState extends State<QuantityCard> {
  var medicineQuantity = 1;

  void quantityInc() {
    setState(() {
      medicineQuantity++;
    });
  }

  void quantityDec() {
    setState(() {
      medicineQuantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceAround,
          // mainAxisAlignment:
          //     MainAxisAlignment.spaceAround,
          children: [
            const Text('Quantity'),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                // mainAxisAlignment:
                //     MainAxisAlignment
                //         .center,
                children: [
                  IconButton(
                      onPressed: quantityInc, icon: const Icon(Icons.add)),
                  Text(medicineQuantity.toString()),
                  IconButton(
                      onPressed: medicineQuantity > 1 ? quantityDec : null,
                      icon: const Icon(Icons.remove)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
              child: ElevatedButton(
                  onPressed: () {
                    widget.getQuantity(medicineQuantity);
                    Navigator.of(context).pop();
                  },
                  child: const Text('submit')),
            )
          ],
        ),
      ),
    );
  }
}
