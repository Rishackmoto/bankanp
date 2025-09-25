import 'package:flutter/material.dart';
import 'package:website/pages/desktop/promo/promodesktop.dart';
import 'package:website/pages/mobile/promo/promomobile.dart';
import 'package:website/pages/tablet/promo/promotablet.dart';

class PromoResponsive extends StatelessWidget {
  const PromoResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const PromoDesktop();
    } else if (width > 600) {
      return const PromoTablet();
    } else {
      return const PromoMobile();
    }
  }
}
