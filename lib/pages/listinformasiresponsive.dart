import 'package:flutter/material.dart';
import 'package:website/pages/desktop/listutamadesktop.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/tablet/listutamatablet.dart';

class ListInformasiResponsive extends StatelessWidget {
  const ListInformasiResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const ListInformasiMobile()
      else if (isTablet)
        const ListInformasiTablet()
      else if (isDesktop)
        const ListInformasi()
    ]);
  }
}
