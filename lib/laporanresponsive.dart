import 'package:flutter/material.dart';
import 'package:website/pages/desktop/laporandesktop.dart';
import 'package:website/pages/mobile/laporanmobile.dart';
import 'package:website/pages/tablet/laporantablet.dart';

class LaporanResponsive extends StatelessWidget {
  const LaporanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const LaporanDesktop();
    } else if (width > 600) {
      return const LaporanTablet();
    } else {
      return const LaporanMobile();
    }
  }
}
