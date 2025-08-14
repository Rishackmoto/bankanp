import 'package:flutter/material.dart';
import 'package:website/pages/desktop/navbardesktop.dart';
import 'package:website/pages/mobile/navbarmobile.dart';

class ResponsiveNavbar extends StatelessWidget {
  const ResponsiveNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 1100) {
      return const NavbarMobile();
    } else {
      return const NavbarDesktop();
    }
  }
}
