import 'package:flutter/material.dart';
import 'package:website/pages/desktop/informasikegiatandesktop.dart';
import 'package:website/pages/mobile/informasikegiatanmobile.dart';
import 'package:website/pages/tablet/informasikegiatantablet.dart';

class InformasiResponsive extends StatelessWidget {
  const InformasiResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const InformasiKegiatanDesktop();
    } else if (width > 600) {
      return const InformasiKegiatanTablet();
    } else {
      return const InformasiKegiatanMobile();
    }
  }
}
