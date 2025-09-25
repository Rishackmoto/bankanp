import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TampilanIklanBeranda extends StatelessWidget {
  final List<String> images = [
    'assets/images/hut8.png',
    'assets/images/brolandscap.png',
    'assets/images/pelanggannasional3.png',
    'assets/images/iklandepositolandscape.png',
  ];
  TampilanIklanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: true,
        initialPage: 0,
      ),
      items: images.map(
        (e) {
          return Image.asset(
            e,
            fit: BoxFit.fitWidth,
          );
        },
      ).toList(),
    );
  }
}
