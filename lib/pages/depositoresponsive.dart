import 'package:flutter/material.dart';
import 'package:website/pages/desktop/depositodesk.dart';
import 'package:website/pages/mobile/depositomobile.dart';
import 'package:website/pages/tablet/depositotablet.dart';

class DepositoResponsive extends StatelessWidget {
  const DepositoResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const DepositoDesktop();
    } else if (width > 600) {
      return const DepositoTablet();
    } else {
      return const DepositoMobile();
    }
  }
}
