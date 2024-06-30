import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({super.key});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final CarouselController _carouselController = CarouselController();
    return Column(
      children: [
        CarouselSlider(
          items: [
            // Your carousel items here
            Container(
              child: Image.asset(
                "assets/images/banner1.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ],
          carouselController: _carouselController,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 16 / 9,
          ),
        ),
      ],
    );
  }
}
