import 'package:flutter/material.dart';
import 'package:miss/pages/footerresponsive.dart';
import 'package:miss/pages/listinformasiresponsive.dart';

import 'package:miss/pages/responsivenavbar.dart';
import 'package:miss/pages/tampilanutamaresponsive.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ResponsiveNavbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CarouselResponsive(),
              Image.asset(
                'assets/images/80hut_desktops.png',
                fit: BoxFit.cover,
              ),
              const TampilanUtamaResponsive(),
              const ListInformasiResponsive(),
              const FooterResponsive(),
            ],
          ),
        ));
  }
}
