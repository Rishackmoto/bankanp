import 'package:flutter/material.dart';
import 'package:website/pages/desktop/homeiklanpenjualandesktop.dart';
import 'package:website/pages/mobile/homeiklanpenjualanmobile.dart';
import 'package:website/pages/tablet/homeiklanpenjualantablet.dart';

class HomePenjualanResponsive extends StatelessWidget {
  const HomePenjualanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const Homeiklanpenjualanmobile()
      else if (isTablet)
        const Homeiklanpenjualantablet()
      else if (isDesktop)
        const Homeiklanpenjualandesktop()
    ]);
  }
}
