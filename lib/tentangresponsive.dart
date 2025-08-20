import 'package:flutter/material.dart';
import 'package:website/pages/desktop/tentangdesktop.dart';
import 'package:website/pages/mobile/tentangmobile.dart';
import 'package:website/pages/tablet/tentangtablet.dart';

class TentangResponsive extends StatelessWidget {
  const TentangResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const TentangMobile()
      else if (isTablet)
        const TentangTablet()
      else if (isDesktop)
        const TentangDesktop()
    ]);
  }
}
