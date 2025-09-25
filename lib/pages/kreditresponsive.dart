import 'package:flutter/material.dart';
import 'package:website/pages/desktop/kreditdesk.dart';
import 'package:website/pages/mobile/kreditmobile.dart';
import 'package:website/pages/tablet/kredittablet.dart';

class KreditResponsive extends StatelessWidget {
  const KreditResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const KreditDesktop();
    } else if (width > 600) {
      return const KreditTablet();
    } else {
      return const KreditMobile();
    }
  }
}
