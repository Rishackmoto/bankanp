import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/tabungandesk.dart';
import 'package:miss/pages/mobile/tabunganmobile.dart';
import 'package:miss/pages/tablet/tabungantablet.dart';

class TabunganResponsive extends StatelessWidget {
  const TabunganResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const TabunganMobile()
      else if (isTablet)
        const TabunganTablet()
      else if (isDesktop)
        const TabunganDesktop()
    ]);
  }
}
