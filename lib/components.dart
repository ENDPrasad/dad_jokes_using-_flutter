import 'package:flutter/material.dart';

List<BoxShadow> b1 = const [BoxShadow(
color: Colors.black45,
offset: Offset(3.0, 4.0),
blurRadius: 5.0,
spreadRadius: 1.0,
)];


// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 50.0,
      padding: const EdgeInsets.all(10.0),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        // If we are using decoration then the color attribute must be within the box decoration
        // or else it will throw an error
        color: Colors.black54,
        boxShadow: b1,
        // To get the curved edges
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Text(
        'Get a joke',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          // fontWeight: FontWeight.bold,
          fontFamily: 'Verdana',
        ),
      ),
    );
  }
}
