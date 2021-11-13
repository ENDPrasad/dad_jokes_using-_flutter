import 'package:flutter/material.dart';

class Liquid_slide extends StatefulWidget {
  String image;
  Liquid_slide({Key? key, required this.image}) : super(key: key);

  @override
  _Liquid_slideState createState() => _Liquid_slideState();
}

class _Liquid_slideState extends State<Liquid_slide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: NetworkImage(widget.image),
        fit: BoxFit.cover,
      ),
    );
  }
}
