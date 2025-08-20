import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/navbardesktop.dart';
import 'package:miss/pages/mobile/navbarmobile.dart';
import 'package:miss/pages/tablet/navbartablet.dart';

class ResponsiveNavbar extends StatelessWidget {
  const ResponsiveNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return const NavbarMobile();
    } else if (screenWidth > 600 && screenWidth < 1100) {
      return const NavbarTablet();
    } else {
      return const NavbarDesktop();
    }
  }
}
