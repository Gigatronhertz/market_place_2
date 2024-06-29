import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/onboarding/onboardin3.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';

class onboarding2 extends StatefulWidget {
  const onboarding2({super.key});

  @override
  State<onboarding2> createState() => _onboarding2State();
}

class _onboarding2State extends State<onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  right: 20, top: MediaQuery.of(context).size.height / 15),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: topskip,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 2,
                child: LottieBuilder.asset("assets/animations/pic2.json"),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(137, 212, 253, 209),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Find lodging and accomodation around campus",
                        textAlign: TextAlign.center,
                        style: onboardbold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "finding a place to live just got easier",
                        textAlign: TextAlign.center,
                        style: onboardsmall,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: slider(
                          page: 1,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => onboarding3(),
                              ));
                        },
                        child: RoundedButton(
                            buttonText: Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: greenbtntext,
                            ),
                            color: Colors.black,
                            height: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
