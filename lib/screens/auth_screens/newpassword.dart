import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/checkboxwidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/profile/editprofile.dart';

class newpassword extends StatefulWidget {
  const newpassword({super.key});

  @override
  State<newpassword> createState() => _newpasswordState();
}

class _newpasswordState extends State<newpassword> {
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
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  left: 10, bottom: MediaQuery.of(context).size.height / 60),
              child: Text(
                "Create Your new password to continue",
                style: onboardsmall,
              ),
            ),
            textfeild(
                title: "Password", helpertxt: "jhon doe", icon: Icons.lock),
            textfeild(
                title: "Confirm new password",
                helpertxt: "jhon doe",
                icon: Icons.lock),
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => editprofile(),
                    ));

                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        surfaceTintColor: Colors.white,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                        content: Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 300,
                            width: 700,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Icon(
                                    Icons.lock_open,
                                    color: white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Reset password Successful!",
                                    style: linktxt,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Please wait...\n"
                                    "You will directed to the homepage",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )));
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                    buttonText: Text(
                      "Continue",
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
