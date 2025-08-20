import 'package:flutter/material.dart';
import 'package:website/pages/desktop/navbardesktop.dart';
import 'package:website/pages/mobile/navbarmobile.dart';
import 'package:website/pages/tablet/navbartablet.dart';

class ResponsiveNavbar extends StatelessWidget {
  const ResponsiveNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const NavbarMobile()
      else if (isTablet)
        const NavbarTablet()
      else if (isDesktop)
        const NavbarDesktop()
    ]);
  }
}
