import 'package:flutter/material.dart';
import 'package:website/pages/desktop/listutamadesktop.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/tablet/listutamatablet.dart';

class ListInformasiResponsive extends StatelessWidget {
  const ListInformasiResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1100) {
      return const ListInformasi();
    } else if (width > 600) {
      return const ListInformasiTablet();
    } else {
      return const ListInformasiMobile();
    }
  }
}
