import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TampilanIklanBeranda extends StatelessWidget {
  final List<String> images = [
    'assets/images/brolandscap.png',
    'assets/images/80hut_desktops.png',
    'assets/images/rumah.png',
    'assets/images/umkm.jpg',
    'assets/images/iklanstep.png',
    'assets/images/trainingsellingskills.png',
  ];
  TampilanIklanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: true,
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
