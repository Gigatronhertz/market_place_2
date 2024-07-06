import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/screens/hostel_screens/hostel_scrren.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';
import 'package:market_place_2/screens/profile/editprofile.dart';
import 'package:market_place_2/screens/store_screens/storescreen.dart';

class Bottomnavbar extends StatelessWidget {
  String page = "Home";

  Bottomnavbar({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                    focusColor: green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductPage(),
                          ));
                    },
                    icon: Icon(
                        size: 30,
                        Icons.home_filled,
                        color: page == "Home" ? green : Colors.black)),
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: page == "Home" ? green : Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "SF-Pro",
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                    focusColor: green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const hostelscreen(),
                          ));
                    },
                    icon: Icon(
                        size: 30,
                        Icons.business,
                        color: page == "Hostel" ? green : Colors.black)),
              ),
              Text(
                "Hostel",
                style: TextStyle(
                  color: page == "Hostel" ? green : Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "SF-Pro",
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),

          //////
          ///
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                color: green,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  size: 40,
                  Icons.add,
                  color: white,
                )),
          ),
          //////////
          ///
          ///
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                    focusColor: green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Storescreen(),
                          ));
                    },
                    icon: Icon(
                        size: 30,
                        Icons.storefront_outlined,
                        color: page == "Store" ? green : Colors.black)),
              ),
              Text(
                "Store",
                style: TextStyle(
                  color: page == "Store" ? green : Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "SF-Pro",
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                    focusColor: green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ));
                    },
                    icon: Icon(
                        size: 30,
                        Icons.person_outline_rounded,
                        color: page == "Profile" ? green : Colors.black)),
              ),
              Text(
                "Profile",
                style: TextStyle(
                  color: page == "Profile" ? green : Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "SF-Pro",
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
