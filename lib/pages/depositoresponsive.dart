import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/depositodesk.dart';
import 'package:miss/pages/mobile/depositomobile.dart';
import 'package:miss/pages/tablet/depositotablet.dart';

class DepositoResponsive extends StatelessWidget {
  const DepositoResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth > 600 && screenWidth < 1100;
    final isDesktop = screenWidth > 1100;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      if (isMobile)
        const DepositoMobile()
      else if (isTablet)
        const DepositoTablet()
      else if (isDesktop)
        const DepositoDesktop()
    ]);
  }
}
