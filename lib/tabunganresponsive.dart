import 'package:flutter/material.dart';
import 'package:website/pages/desktop/tabungandesk.dart';
import 'package:website/pages/mobile/tabunganmobile.dart';
import 'package:website/pages/tablet/tabungantablet.dart';

class TabunganResponsive extends StatelessWidget {
  const TabunganResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const TabunganDesktop();
    } else if (width > 600) {
      return const TabunganTablet();
    } else {
      return const TabunganMobile();
    }
  }
}
