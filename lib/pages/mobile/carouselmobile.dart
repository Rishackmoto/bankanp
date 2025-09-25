import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TampilanIklanBerandaMobile extends StatelessWidget {
  final List<String> images = [
    'assets/images/hut8mobile.png',
    'assets/images/bropotrait.png',
    'assets/images/MaulidNabiMuhammad2025.png',
    'assets/images/iklandepositopotrait.png',
  ];
  TampilanIklanBerandaMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: false,
        initialPage: 0,
      ),
      items: images.map(
        (e) {
          return Image.asset(
            e,
            fit: BoxFit.cover,
          );
        },
      ).toList(),
    );
  }
}
