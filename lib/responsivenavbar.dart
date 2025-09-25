import 'package:flutter/material.dart';
import 'package:website/pages/desktop/navbardesktop.dart';
import 'package:website/pages/mobile/navbarmobile.dart';
import 'package:website/pages/tablet/navbartablet.dart';

class ResponsiveNavbar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const NavbarDesktop();
    } else if (width > 600) {
      return const NavbarTablet();
    } else {
      return const NavbarMobile();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
