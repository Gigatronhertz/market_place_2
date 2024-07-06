import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_place_2/globals/adssliderwidget.dart';
import 'package:market_place_2/globals/adswidget.dart';
import 'package:market_place_2/globals/bottomnavbar.dart';
import 'package:market_place_2/globals/categorieswidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/screens/product_screens/productdetail.dart';
import 'package:market_place_2/screens/store_screens/storedetail.dart';

class Storescreen extends StatefulWidget {
  const Storescreen({super.key});

  @override
  State<Storescreen> createState() => _StorescreenState();
}

class _StorescreenState extends State<Storescreen> {
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    List<String> images = [
      "IMG-20240207-WA0051.jpg",
      "IMG-20240405-WA0015.jpg",
      "IMG-20240405-WA0032.jpg",
      "IMG-20240417-WA0007.jpg",
      "IMG-20240411-WA0061.jpg",
      "IMG-20240409-WA0116.jpg",
      "IMG-20240405-WA0032.jpg",
      "IMG-20240417-WA0007.jpg",
      "IMG-20240411-WA0061.jpg",
      "IMG-20240411-WA0061.jpg",
    ];

    return Scaffold(
        backgroundColor: white,
        body: CustomScrollView(
          clipBehavior: Clip.hardEdge,
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 10,
              backgroundColor: white,
              foregroundColor: white,
              clipBehavior: Clip.hardEdge,
              surfaceTintColor: white,
              shadowColor: white,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 5.5,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  "assets/images/IMG-20240504-WA0015.jpg"),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good morning 👋",
                                style: onboardsmall,
                              ),
                              Text(
                                "Find stores near you ",
                                style: topskip,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/bx_heart (1).png",
                                height: 24,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 15,
                                    height: 15,
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        color: green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '2',
                                      style:
                                          TextStyle(fontSize: 8, color: white),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Image.asset(
                            "assets/images/mage_message-round (1).png",
                            height: 24,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(10, 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: textfeild(
                    helpertxt: "Find Stores",
                    icon: Icons.search,
                  ),
                ),
              ),
            ),

            /////////////////////////////////////////
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Categories(
                  types: "stores",
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                crossAxisCount: 1,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      index % 4 == 0 && index != 0 ? Adswidget() : SizedBox(),
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 1,

                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: green, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                color: Color.fromARGB(162, 0, 0, 0),
                                "assets/images/${images[index]}",
                                colorBlendMode: BlendMode.darken,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Add some space between the image and text
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Richmond's Store",
                                    textAlign: TextAlign.center,
                                    style: boldwhitetext),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Text("Ifite near school gate ",
                                    textAlign: TextAlign.center,
                                    style: greenbtntext),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                SizedBox(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Storedetail(),
                                          ));
                                    },
                                    child: RoundedButton(
                                        buttonText: Text(
                                          "Check Out Store!",
                                          style: greenbtntext,
                                        ),
                                        color: white,
                                        height: 15),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            right: 5, top: 10),
                                        child: Icon(
                                          Icons.location_on,
                                          color: white,
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      child: const Text(
                                          "Ifite near school gate ",
                                          textAlign: TextAlign.start,
                                          style: greenbtntext),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Bottomnavbar(page: "Store"));
  }
}
