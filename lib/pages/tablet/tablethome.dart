import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/listinformasiresponsive.dart';

import 'package:website/pages/responsivenavbar.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: ResponsiveNavbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselResponsive(),
              TampilanUtamaResponsive(),
              Text('TABLET'),
              ListInformasiResponsive(),
              FooterResponsive(),
            ],
          ),
        ));
  }
}
