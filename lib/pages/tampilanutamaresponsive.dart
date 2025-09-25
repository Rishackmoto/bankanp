import 'package:flutter/material.dart';
import 'package:website/pages/desktop/tampilanutamadesktop.dart';
import 'package:website/pages/mobile/tampilanutamamobile.dart';
import 'package:website/pages/tablet/tampilanutamatablet.dart';

class TampilanUtamaResponsive extends StatelessWidget {
  const TampilanUtamaResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const TampilanUtama();
    } else if (width > 600) {
      return const TampilanUtamaTablet();
    } else {
      return const TampilanUtamaMobile();
    }
  }
}
