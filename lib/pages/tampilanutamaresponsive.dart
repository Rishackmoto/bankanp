import 'package:flutter/material.dart';
import 'package:website/pages/desktop/tampilanutamadesktop.dart';
import 'package:website/pages/mobile/tampilanutamamobile.dart';

class TampilanUtamaResponsive extends StatelessWidget {
  const TampilanUtamaResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600; //&& screenWidth < 1024;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const TampilanUtamaMobile()
      else if (isTablet)
        const TampilanUtama()
    ]);
  }
}
