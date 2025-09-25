import 'package:flutter/material.dart';
import 'package:website/pages/desktop/tentangdesktop.dart';
import 'package:website/pages/mobile/tentangmobile.dart';
import 'package:website/pages/tablet/tentangtablet.dart';

class TentangResponsive extends StatelessWidget {
  const TentangResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const TentangDesktop();
    } else if (width > 600) {
      return const TentangTablet();
    } else {
      return const TentangMobile();
    }
  }
}
