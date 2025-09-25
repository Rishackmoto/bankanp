import 'package:flutter/material.dart';
import 'package:website/pages/desktop/footerdesktop.dart';
import 'package:website/pages/mobile/footermobile.dart';
import 'package:website/pages/tablet/footertablet.dart';

class FooterResponsive extends StatelessWidget {
  const FooterResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const Footerdesktop();
    } else if (width > 600) {
      return const FooterTablet();
    } else {
      return const Footermobile();
    }
  }
}
