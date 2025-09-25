import 'package:flutter/material.dart';
import 'package:website/pages/desktop/pengaduandesktop.dart';
import 'package:website/pages/mobile/pengaduanmobile.dart';
import 'package:website/pages/tablet/pengaduantablet.dart';

class PengaduanResponsive extends StatelessWidget {
  const PengaduanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const PengaduanNasabahDesktop();
    } else if (width > 600) {
      return const PengaduanNasabahTablet();
    } else {
      return const PengaduanNasabahMobile();
    }
  }
}
