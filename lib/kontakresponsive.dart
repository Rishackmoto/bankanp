import 'package:flutter/material.dart';
import 'package:website/pages/desktop/kontakdesktop.dart';
import 'package:website/pages/mobile/kontakmobilde.dart';
import 'package:website/pages/tablet/kontaktablet.dart';

class KontakResponsive extends StatelessWidget {
  const KontakResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const KontakMobile()
      else if (isTablet)
        const KontakTablet()
      else if (isDesktop)
        const KontakDesktop()
    ]);
  }
}
