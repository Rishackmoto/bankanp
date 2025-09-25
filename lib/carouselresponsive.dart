import 'package:flutter/material.dart';
import 'package:website/pages/desktop/carouseldesktop.dart';
import 'package:website/pages/mobile/carouselmobile.dart';
import 'package:website/pages/tablet/carouseltablet.dart';

class CarouselResponsive extends StatelessWidget {
  const CarouselResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return TampilanIklanBeranda();
    } else if (width > 600) {
      return TampilanIklanBerandaTablet();
    } else {
      return TampilanIklanBerandaMobile();
    }
  }
}
