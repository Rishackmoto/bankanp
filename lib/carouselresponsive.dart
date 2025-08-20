import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/carouseldesktop.dart';
import 'package:miss/pages/mobile/carouselmobile.dart';
import 'package:miss/pages/tablet/carouseltablet.dart';

class CarouselResponsive extends StatelessWidget {
  const CarouselResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        TampilanIklanBerandaMobile()
      else if (isTablet)
        TampilanIklanBerandaTablet()
      else if (isDesktop)
        TampilanIklanBeranda()
    ]);
  }
}
