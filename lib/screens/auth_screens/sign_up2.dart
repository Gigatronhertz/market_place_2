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
import 'package:market_place_2/screens/auth_screens/login.dart';
import 'package:market_place_2/screens/auth_screens/sign_up2.dart';
import 'package:market_place_2/screens/onboarding/onboardin1.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';

class signup2 extends StatefulWidget {
  const signup2({super.key});

  @override
  State<signup2> createState() => _signup2State();
}

class _signup2State extends State<signup2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                "Create an Account",
                style: onboardbold,
              ),
            ),
            textfeild(title: "Name", helpertxt: "jhon doe", icon: Icons.person),
            textfeild(title: "Email", helpertxt: "jhon doe", icon: Icons.email),
            textfeild(
                title: "Password", helpertxt: "jhon doe", icon: Icons.lock),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: checkbox(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Text(
                  "Remenber Me",
                  style: onboardsmall,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
              color: Color.fromARGB(255, 159, 237, 162),
              height: 2,
              width: MediaQuery.of(context).size.width / 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: onboardsmall,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Text(
                  "Log in",
                  style: linktxt,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ));
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                    buttonText: Text(
                      "Sign Up",
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
