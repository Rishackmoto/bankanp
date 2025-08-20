import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/navbardesktop.dart';
import 'package:lottie/lottie.dart';
import 'package:miss/pages/footerresponsive.dart';

class DepositoDesktop extends StatelessWidget {
  const DepositoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: NavbarDesktop()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: Row(
              children: [
                Lottie.asset('assets/lottie/meditation.json',
                    height: MediaQuery.sizeOf(context).height / 1.5),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deposito - Diam tapi tumbuh!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          'Deposito itu seperti taman keuangan — kamu tanam hari ini, dan panen bunga di waktu yang kamu tentukan. Aman, pasti, dan menguntungkan!',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🏦 Keunggulan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Bunga Kompetitif – Lebih tinggi dari tabungan biasa',
                            ),
                            Text(
                              '✅Tenor Fleksibel – 1, 3, 6, 12 bulan, tinggal pilih',
                            ),
                            Text(
                              '✅Dijamin LPS – Tenang dan bebas khawatir',
                            ),
                            Text(
                              '✅Aman & Tanpa Risiko Pasar',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🎯 Cocok Buat Kamu Yang',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Mau menyimpan uang untuk kebutuhan jangka menengah',
                            ),
                            Text(
                              '✅Nggak mau tergoda tarik-tarik uang',
                            ),
                            Text(
                              '✅Pengen penghasilan pasif dari bunga yang stabil',
                            ),
                            Text(
                              '✅Siap disiplin demi tujuan besar 💪',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📝 Syarat Mudah:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅KTP atau identitas resmi',
                            ),
                            Text(
                              '✅Setoran awal minimal Rp.5.000.000',
                            ),
                            Text(
                              '✅Pilih jangka waktu sesuai kebutuhanmu',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Jangan biarkan uangmu diam… biarkan dia tumbuh dengan Deposito!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}
