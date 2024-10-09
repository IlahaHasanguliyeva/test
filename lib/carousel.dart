import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/slider1.png',
  'assets/images/slider1.png',
  'assets/images/slider1.png'
];

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var currentPage = 0;

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: i == currentPage ? Colors.orange : Colors.grey,
                shape: BoxShape.circle),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CarouselSlider(
            items: imgList
                .map(
                  (e) => Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(e)),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                viewportFraction: 0.75,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (value, _) {
                  setState(() {
                    currentPage = value;
                  });
                }),
          ),
        ),
        buildCarouselIndicator(),
      ],
    );
  }
}
