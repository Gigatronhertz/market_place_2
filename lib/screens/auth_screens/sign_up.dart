import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/auth_button.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/auth_screens/sign_up2.dart';
import 'package:market_place_2/screens/onboarding/onboardin1.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
                "Lets get to know you",
                style: onboardsmall,
              ),
            ),
            GoogleSignUpButton(
                onPressed: () {},
                content: "Continue with Google",
                imageAssetss: "assets/images/icons8-google-48.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            GoogleSignUpButton(
                onPressed: () {},
                content: "Continue with Facebook",
                imageAssetss: "assets/images/icons8-facebook-48.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            GoogleSignUpButton(
                onPressed: () {},
                content: "Continue with Apple",
                imageAssetss: "assets/images/icons8-apple-48.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 2,
                  color: Color.fromARGB(255, 164, 236, 166),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "OR",
                  style: onboardsmall,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 2,
                  color: Color.fromARGB(255, 164, 236, 166),
                ),
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
                      builder: (context) => signup2(),
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
            )
          ],
        ),
      ),
    );
  }
}
