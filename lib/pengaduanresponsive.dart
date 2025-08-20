import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/pengaduandesktop.dart';
import 'package:miss/pages/mobile/pengaduanmobile.dart';
import 'package:miss/pages/tablet/pengaduantablet.dart';

class PengaduanResponsive extends StatelessWidget {
  const PengaduanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const PengaduanNasabahMobile()
      else if (isTablet)
        const PengaduanNasabahTablet()
      else if (isDesktop)
        const PengaduanNasabahDesktop()
    ]);
  }
}
