import 'package:flutter/material.dart';

class ClickableContainer extends StatelessWidget {
  // const ClickableContainer({ Key? key }) : super(key: key);
  final Color kalar;
  final double padd;
  final double heit;
  final double widt;
  final double radius;
  final Widget kid;
  final VoidCallback? tap;
  ClickableContainer({
    this.kalar = Colors.transparent,
    this.padd = 0.0,
    this.heit = 400,
    this.widt = 400,
    this.radius = 0.0,
    required this.kid,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: heit,
        width: widt,
        padding: EdgeInsets.all(padd),
        decoration: BoxDecoration(
          color: kalar,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: kid,
      ),
    );
  }
}
