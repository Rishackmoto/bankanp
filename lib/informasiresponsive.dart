import 'package:flutter/material.dart';
import 'package:website/pages/desktop/homeiklanpenjualandesktop.dart';
import 'package:website/pages/desktop/informasikegiatandesktop.dart';

class InformasiResponsive extends StatelessWidget {
  const InformasiResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const InformasiKegiatanDesktop()
      else if (isTablet)
        const InformasiKegiatanDesktop()
      else if (isDesktop)
        const Homeiklanpenjualandesktop()
    ]);
  }
}
