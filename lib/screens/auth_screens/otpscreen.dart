import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/auth_screens/newpassword.dart';

class otpscreen extends StatefulWidget {
  const otpscreen({super.key});

  @override
  State<otpscreen> createState() => _loginState();
}

class _loginState extends State<otpscreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String password;
  late String email;
  bool obscuretect = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(15),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Container(
                child: Text(
                  "Code has been sent to al*******@gmail.com",
                  style: onboardsmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Container(
                child: OtpTextField(
                  margin: EdgeInsets.all(
                    MediaQuery.of(context).size.width / 40,
                  ),
                  filled: true,

                  fillColor: lightgreen1,
                  keyboardType: TextInputType.number,
                  fieldHeight: MediaQuery.of(context).size.height / 14,

                  fieldWidth: MediaQuery.of(context).size.width / 7,
                  borderRadius: BorderRadius.circular(15),

                  textStyle: onboardsmall,

                  numberOfFields: 4,
                  //   borderColor: Colors.black38,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content:
                    //             Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  }, // end onSubmit
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Resend code in ",
                    style: onboardsmall,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 100,
                  ),
                  Text(
                    "48s",
                    style: linktxt,
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newpassword(),
                      ));
                },
                child: Container(
                  height: 50,
                  child: RoundedButton(
                      buttonText: Text(
                        "Verify",
                        style: greenbtntext,
                      ),
                      color: Colors.green,
                      height: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
