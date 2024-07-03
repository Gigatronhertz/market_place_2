import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_place_2/globals/squarebutton.dart';

class hosteldetail extends StatefulWidget {
  const hosteldetail({super.key});

  @override
  State<hosteldetail> createState() => _hosteldetailState();
}

class _hosteldetailState extends State<hosteldetail> {
  List<String> images = [
    "image 72 (1).png",
    "image 72 (2).png",
    "image 72 (1).png",
    "image 72 (2).png",
    "image 72 (1).png",
    "image 72 (2).png",
    "image 72 (1).png",
    "image 72 (2).png",
    "image 72 (1).png",
    "image 72 (2).png",
    "image 72 (1).png",
    "image 72 (2).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height / 1.7,
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Image.asset(
                      "assets/images/${images[index]}",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              alignment: AlignmentDirectional.bottomCenter,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "2 bed room lodge",
                      style: onboardbold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: green.withOpacity(0.3),
                          ),
                          child: const Text(
                            "Available",
                            style: onboardsmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: Icon(Icons.location_on)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: const Text("Ifite near school gate ",
                            textAlign: TextAlign.start, style: onboardsmall),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 12, bottom: 10, top: 20),
                            child: Text(
                              "Descriptions",
                              style: smallbold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, bottom: 20),
                            child: Text(
                              "Discover the ultimate blend of comfort and performance with our Ladies Long Sleeve V Neck Moisture Wicking Athletic Shirt.",
                              style: descriptiontext,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 12, bottom: 20),
                                child: Image.asset(
                                  "assets/images/whatsapp_icon.png",
                                  height: 30,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, bottom: 20),
                                child: Text(
                                  "08053288472",
                                  style: onboardsmall,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  height: 29,
                                  child: Image.asset(
                                      "assets/images/Vector (8).png"),
                                ),
                                const Text(
                                  "500,000",
                                  textAlign: TextAlign.start,
                                  style: pricelarge,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: RoundedButton(
                                        buttonText: Text(
                                          "Message",
                                          style: greenbtntext,
                                        ),
                                        color: white,
                                        height: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
