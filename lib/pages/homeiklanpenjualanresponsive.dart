import 'package:flutter/material.dart';
import 'package:website/pages/desktop/homeiklanpenjualandesktop.dart';
import 'package:website/pages/mobile/homeiklanpenjualanmobile.dart';
import 'package:website/pages/tablet/homeiklanpenjualantablet.dart';

class HomePenjualanResponsive extends StatelessWidget {
  const HomePenjualanResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const Homeiklanpenjualandesktop();
    } else if (width > 600) {
      return const Homeiklanpenjualantablet();
    } else {
      return const Homeiklanpenjualanmobile();
    }
  }
}
