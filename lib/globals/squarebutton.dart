import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Text buttonText;

  final double width;
  final double height;
  final Color color;

  RoundedButton(
      {required this.buttonText,
      required this.color,
      this.width = double.infinity,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: buttonText,
        height: MediaQuery.of(context).size.height / height,
        width: width,
        decoration: BoxDecoration(
            color: Color.fromARGB(240, 13, 151, 3),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
      ),
    );
  }
}
