import 'package:flutter/material.dart';
import 'package:website/pages/mobile/footermobile.dart';
import 'package:website/pages/mobile/listutamamobile.dart';
import 'package:website/pages/mobile/navbarmobile.dart';
import 'package:website/pages/tampilanutamaresponsive.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NavbarMobile(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CarouselResponsive(),
              Image.asset(
                'assets/images/80hut_mobile.png',
                fit: BoxFit.cover,
              ),
              const TampilanUtamaResponsive(),

              const ListInformasiMobile(),
              const Footermobile()
            ],
          ),
        ));
  }
}
