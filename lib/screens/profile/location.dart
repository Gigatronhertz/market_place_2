import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/screens/profile/sellectlocation.dart';

class location1 extends StatefulWidget {
  const location1({super.key});

  @override
  State<location1> createState() => _location1State();
}

class _location1State extends State<location1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                child: Icon(size: 30, color: green, Icons.location_on),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                alignment: Alignment.center,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(70)),
              ),
              SizedBox(
                height: 0,
              ),
              Container(
                child: Text(
                    style: topskip,
                    textAlign: TextAlign.center,
                    "Enable Location."),
              ),
              Container(
                child: Text(
                    style: onboardsmall,
                    textAlign: TextAlign.center,
                    "You need to enable location to be able to see products near you."),
              ),

              //
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.42),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: green),
                    color: green,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mapscreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Text(" Allow Location ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
