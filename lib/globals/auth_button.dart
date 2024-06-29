import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';

class GoogleSignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  String content;
  String imageAssetss;
  double boder;
  GoogleSignUpButton(
      {required this.onPressed,
      required this.content,
      this.boder = 0,
      required this.imageAssetss});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: boder),
          color: lightgreen1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 30, left: 20),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                imageAssetss, // Replace 'assets/google_logo.png' with your Google logo asset
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(width: 10),
            Text(
              content,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
