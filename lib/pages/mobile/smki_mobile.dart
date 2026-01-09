import 'package:flutter/material.dart';

class SmkiMobile extends StatelessWidget {
  const SmkiMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 800,
            child: Image.asset('assets/images/FaktaIntegritas.jpeg')),
        const SizedBox(height: 30),
        SizedBox(
            height: 800,
            child: Image.asset('assets/images/KebijakanInformasi.jpeg')),
      ],
    );
  }
}
