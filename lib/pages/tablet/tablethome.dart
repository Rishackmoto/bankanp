import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/listinformasiresponsive.dart';
import 'package:website/pages/tablet/smki_tablet.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';
import 'package:website/responsivenavbar.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ResponsiveNavbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselResponsive(),
              TampilanUtamaResponsive(),
              ListInformasiResponsive(),
              SmkiTablet(),
              FooterResponsive(),
            ],
          ),
        ));
  }
}
