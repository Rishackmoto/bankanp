import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
import 'package:website/pages/desktop/smki_desktop.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/listinformasiresponsive.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';
import 'package:website/responsivenavbar.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90), child: ResponsiveNavbar()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CarouselResponsive(),
                TampilanUtamaResponsive(),
                ListInformasiResponsive(),
                SmkiDesktop(),
                FooterResponsive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
