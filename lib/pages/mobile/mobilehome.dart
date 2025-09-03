import 'package:flutter/material.dart';
import 'package:website/carouselresponsive.dart';
import 'package:website/pages/mobile/footermobile.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/mobile/navbarmobile.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NavbarMobile(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselResponsive(),
              TampilanUtamaResponsive(),
              ListInformasiMobile(),
              Footermobile()
            ],
          ),
        ));
  }
}
