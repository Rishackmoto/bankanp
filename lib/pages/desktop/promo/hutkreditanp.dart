import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HutPromoKreditDesktop extends StatelessWidget {
  const HutPromoKreditDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'RAYAKAN 8 TAHUN BERSAMA KAMI',
          style: GoogleFonts.roboto(
              color: Colors.deepPurple,
              fontSize: 60,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/8ok.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Image.asset('assets/images/brosurvoucher.png',
                        fit: BoxFit.cover),
                    Text(
                      '* Ajukan Kredit Sekarang & Dapatkan Hadiah Voucher Mulai dari Rp25.000 hingga Rp2.500.000',
                      style: GoogleFonts.roboto(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
