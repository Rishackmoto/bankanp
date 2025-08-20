import 'package:flutter/material.dart';
import 'package:miss/pages/mobile/footermobile.dart';
import 'package:miss/pages/mobile/listutamamobile.dart';
import 'package:miss/pages/responsivenavbar.dart';
import 'package:miss/pages/tampilanutamaresponsive.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

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
