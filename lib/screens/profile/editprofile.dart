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

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        color: white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              children: [
                Container(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 20),
                Container(
                  child: Text(
                    "Edit profile",
                    style: topskip,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Stack(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/personplaceholder.png")),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Icon(
                        Icons.mode_edit_outlined,
                        color: white,
                        size: 15,
                      )),
                ),
              ],
            ),
            textfeild(title: "Name", helpertxt: "jhon doe", icon: Icons.person),
            textfeild(
                title: "Email",
                helpertxt: "Jh********@gmail.com",
                icon: Icons.email),
            textfeild(
                title: "Phone Number",
                helpertxt: "088******4",
                icon: Icons.email),
            textfeild(
                title: "Gender",
                helpertxt: "female",
                icon: Icons.female_outlined),
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
                      builder: (context) => ProductPage(),
                    ));
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                    buttonText: Text(
                      "Save",
                      style: greenbtntext,
                    ),
                    color: green,
                    height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
