import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_place_2/globals/adssliderwidget.dart';
import 'package:market_place_2/globals/adswidget.dart';
import 'package:market_place_2/globals/bottomnavbar.dart';
import 'package:market_place_2/globals/categorieswidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/screens/product_screens/productdetail.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
                                "Richmond",
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
                    helpertxt: "search",
                    icon: Icons.search,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: AdsSlider()),
              ),
            ),
            /////////////////////////////////////////
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Categories(
                  types: "products",
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
                crossAxisCount: 2,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      index % 4 == 0 || index == images.length
                          ? Adswidget()
                          : SizedBox(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Productdetail(),
                              ));
                        },
                        child: Container(
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Bottomnavbar(page: "Home"));
  }
}
