import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/auth_screens/sign_up.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';

class onboarding3 extends StatefulWidget {
  const onboarding3({super.key});

  @override
  State<onboarding3> createState() => _onboarding3State();
}

class _onboarding3State extends State<onboarding3> {
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
                child: LottieBuilder.asset("assets/animations/pic4.json"),
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
                        "Set up an online store to reach a wider audience",
                        textAlign: TextAlign.center,
                        style: onboardbold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "the store feature allows you to set up an store for you on-campuss bussines",
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
                                builder: (context) => signup(),
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
