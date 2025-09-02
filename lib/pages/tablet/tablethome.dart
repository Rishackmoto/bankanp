import 'package:flutter/material.dart';
import 'package:website/pages/listinformasiresponsive.dart';
import 'package:website/pages/tablet/footertablet.dart';
import 'package:website/pages/tablet/navbartablet.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NavbarTablet(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CarouselResponsive(),
              Image.asset(
                'assets/images/brolandscap.png',
                fit: BoxFit.cover,
              ),
              const TampilanUtamaResponsive(),
              const ListInformasiResponsive(),
              const FooterTablet(),
            ],
          ),
        ));
  }
}
