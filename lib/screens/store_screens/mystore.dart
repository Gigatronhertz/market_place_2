import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_place_2/globals/adssliderwidget.dart';
import 'package:market_place_2/globals/adswidget.dart';
import 'package:market_place_2/globals/bottomnavbar.dart';
import 'package:market_place_2/globals/categorieswidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/screens/product_screens/editproduct.dart';
import 'package:market_place_2/screens/product_screens/productdetail.dart';

class Mystore extends StatefulWidget {
  const Mystore({super.key});

  @override
  State<Mystore> createState() => _MystoreState();
}

class _MystoreState extends State<Mystore> {
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
                              "Welcome to 👋",
                              style: onboardsmall,
                            ),
                            Text(
                              "Richmond's Store",
                              style: topskip,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
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
                  helpertxt: "search",
                  icon: Icons.search,
                ),
              ),
            ),
          ),

          /////////////////////////////////////////

          SliverToBoxAdapter(
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: green, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(
                                      "assets/images/${images[index]}"),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Add some space between the image and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Ladies Bracelet",
                                      textAlign: TextAlign.start,
                                      style: topskip),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          height: 15,
                                          child: Image.asset(
                                              "assets/images/Vector (8).png")),
                                      const Text("2,500",
                                          textAlign: TextAlign.start,
                                          style: topskip),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text("fine small affordable bracelets",
                                      textAlign: TextAlign.start,
                                      style: tinytext),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.verified_outlined,
                                          color: green,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: green.withOpacity(0.3)),
                                        child: const Text(
                                          style: onboardsmall,
                                          "2/13/2024",
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Container(
                            //  decoration: BoxDecoration(color: Colors.black38),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProduct(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset.zero,
                                    )
                                  ],
                                  color: Colors.amber,
                                )),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset.zero,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
