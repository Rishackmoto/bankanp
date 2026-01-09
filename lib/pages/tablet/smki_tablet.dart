import 'package:flutter/material.dart';

class SmkiTablet extends StatelessWidget {
  const SmkiTablet({super.key});

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
