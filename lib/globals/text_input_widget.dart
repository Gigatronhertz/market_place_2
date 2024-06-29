import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place_2/globals/customaizables.dart';

class textfeild extends StatelessWidget {
  double boder;
  String helpertxt;
  IconData icon;
  String lagicon;
  String title;
  textfeild(
      {this.boder = 0,
      required this.helpertxt,
      required this.icon,
      required this.title,
      this.lagicon = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: onboardsmall,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 1,
          height: 55,
          decoration: BoxDecoration(
            color: lightgreen1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(),
                  alignment: Alignment.centerLeft,
                  child: Icon(icon)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: TextField(
                    style: onboardsmall,
                    decoration: InputDecoration(
                        hintStyle: onboardsmall,
                        hintText: helpertxt,
                        border: InputBorder.none),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
