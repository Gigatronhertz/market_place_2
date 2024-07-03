import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place_2/globals/customaizables.dart';

class Categories extends StatelessWidget {
  String types = "";
  Categories({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "All",
      "Clothing",
      "Smartphones",
      "Laptops",
      "Food",
      "Accessories",
      "Other"
    ];
    List<String> hostelcategories = [
      "2 bedroom",
      "3 beds",
      "self-con",
      "detached",
      "single room",
      "4bed",
      "Other"
    ];
    List<String> storecategories = [
      "All",
      "Clothing",
      "Smartphones",
      "Laptops",
      "Food",
      "Accessories",
      "Other"
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Categories",
                style: topskip,
              ),
              Expanded(child: SizedBox()),
              Text(
                "Reset",
                style: onboardsmall,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(types == "hostel"
                      ? hostelcategories[index]
                      : types == "products"
                          ? categories[index]
                          : storecategories[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
