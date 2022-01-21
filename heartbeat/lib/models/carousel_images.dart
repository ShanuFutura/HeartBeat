import 'package:flutter/cupertino.dart';

class CarouselImages {
  static List<Widget> itemsList = [
    Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/images/doc_tools.jpg',
            fit: BoxFit.fill,
          ),
        )),
    Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/images/doc_with_phone.jpg',
            fit: BoxFit.fill,
          ),
        )),
    Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/images/medicines.jpeg',
            fit: BoxFit.fill,
          ),
        )),
  ];
}
