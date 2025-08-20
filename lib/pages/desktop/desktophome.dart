import 'package:flutter/material.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/listinformasiresponsive.dart';
import 'package:website/pages/responsivenavbar.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: ResponsiveNavbar()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ),
      ),
    );
  }
}
