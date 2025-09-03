import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TampilanIklanBerandaMobile extends StatelessWidget {
  final List<String> images = [
    'assets/images/bropotrait.png',
    'assets/images/80hut_mobile.png',
    'assets/images/rumah.png',
    'assets/images/umkm.jpg',
    'assets/images/kredit.png',
    'assets/images/trainingsellingskills.png',
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
