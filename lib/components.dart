import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  String name;
  CustomButtonWidget({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 50.0,
      padding: const EdgeInsets.all(10.0),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        color: const Color(0xff536162),
        borderRadius: BorderRadius.circular(20.0),
        // border: Border.all(
        //   width: 5.0,
        //   color: Colors.black45,
        //   style: BorderStyle.solid,
        // ),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Verdana',
        ),
      ),
    );
  }
}
