import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';

class Adswidget extends StatelessWidget {
  const Adswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: green, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset("assets/images/nawe.jpg")),
          ),
        ],
      ),
    );
  }
}
