import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/auth_button.dart';
import 'package:market_place_2/globals/checkboxwidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/auth_screens/otpscreen.dart';
import 'package:market_place_2/screens/auth_screens/sign_up2.dart';
import 'package:market_place_2/screens/onboarding/onboardin1.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(15),
        color: white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 3,
                child: LottieBuilder.asset("assets/animations/pic4.json"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 60),
              child: Text(
                textAlign: TextAlign.center,
                "Please enter your email and an OTP will be sent to you",
                style: onboardsmall,
              ),
            ),
            textfeild(title: "Email", helpertxt: "jhon doe", icon: Icons.email),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => otpscreen(),
                    ));
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                    buttonText: Text(
                      "Send OTP",
                      style: greenbtntext,
                    ),
                    color: Colors.green,
                    height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
