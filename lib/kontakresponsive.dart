import 'package:flutter/material.dart';
import 'package:website/pages/desktop/kontakdesktop.dart';
import 'package:website/pages/mobile/kontakmobilde.dart';
import 'package:website/pages/tablet/kontaktablet.dart';

class KontakResponsive extends StatelessWidget {
  const KontakResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const KontakDesktop();
    } else if (width > 600) {
      return const KontakTablet();
    } else {
      return const KontakMobile();
    }
  }
}
