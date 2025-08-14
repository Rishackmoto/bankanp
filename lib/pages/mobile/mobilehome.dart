import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
// ignore: unused_import
import 'package:website/pages/desktop/carouseldesktop.dart';
// ignore: unused_import
import 'package:website/pages/listinformasiresponsive.dart';
import 'package:website/pages/mobile/footermobile.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/responsivenavbar.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), child: ResponsiveNavbar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselResponsive(),
              Text('MOBILE'),
              TampilanUtamaResponsive(),
              ListInformasiMobile(),
              Footermobile()
            ],
          ),
        ));
  }
}
