import 'package:flutter/material.dart';
import 'package:website/pages/desktop/laporandesktop.dart';
import 'package:website/pages/mobile/laporanmobile.dart';
import 'package:website/pages/tablet/laporantablet.dart';

class LaporanResponsive extends StatelessWidget {
  const LaporanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const LaporanMobile()
      else if (isTablet)
        const LaporanTablet()
      else if (isDesktop)
        const LaporanDesktop()
    ]);
  }
}
