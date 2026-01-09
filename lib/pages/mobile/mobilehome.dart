import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/mobile/smki_mobile.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';
import 'package:website/responsivenavbar.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

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
              ListInformasiMobile(),
              SmkiMobile(),
              FooterResponsive(),
            ],
          ),
        ));
  }
}
