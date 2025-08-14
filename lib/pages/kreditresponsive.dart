import 'package:flutter/material.dart';
import 'package:website/pages/desktop/kreditdesk.dart';
import 'package:website/pages/mobile/kreditmobile.dart';

class KreditResponsive extends StatelessWidget {
  const KreditResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1024;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const KreditMobile()
      else if (isTablet)
        const KreditDesktop()
    ]);
  }
}
