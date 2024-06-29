import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';

class checkbox extends StatefulWidget {
  const checkbox({super.key});

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        click = !click;
        setState(() {});
      },
      child: Container(
        child: Icon(
          Icons.check,
          color: white,
        ),
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          color: click ? Colors.green : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: Colors.green),
        ),
      ),
    );
  }
}
