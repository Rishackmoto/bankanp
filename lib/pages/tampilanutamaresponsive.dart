import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/tampilanutamadesktop.dart';
import 'package:miss/pages/mobile/tampilanutamamobile.dart';
import 'package:miss/pages/tablet/tampilanutamatablet.dart';

class TampilanUtamaResponsive extends StatelessWidget {
  const TampilanUtamaResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const TampilanUtamaMobile()
      else if (isTablet)
        const TampilanUtamaTablet()
      else if (isDesktop)
        const TampilanUtama()
    ]);
  }
}
