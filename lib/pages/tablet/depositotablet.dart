import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/tablet/navbartablet.dart';

class DepositoTablet extends StatelessWidget {
  const DepositoTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: NavbarTablet()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Lottie.asset('assets/lottie/meditation.json',
                        height: MediaQuery.sizeOf(context).height / 3),
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '🏦 Keunggulan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Bunga Kompetitif – Lebih tinggi dari tabungan biasa',
                ),
                const Text(
                  '✅Tenor Fleksibel – 1, 3, 6, 12 bulan, tinggal pilih',
                ),
                const Text(
                  '✅Dijamin LPS – Tenang dan bebas khawatir',
                ),
                const Text(
                  '✅Aman & Tanpa Risiko Pasar',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '🎯 Cocok Buat Kamu Yang',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Mau menyimpan uang untuk kebutuhan jangka menengah',
                ),
                const Text(
                  '✅Nggak mau tergoda tarik-tarik uang',
                ),
                const Text(
                  '✅Pengen penghasilan pasif dari bunga yang stabil',
                ),
                const Text(
                  '✅Siap disiplin demi tujuan besar 💪',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '📝 Syarat Mudah:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅KTP atau identitas resmi',
                ),
                const Text(
                  '✅Setoran awal minimal Rp.5.000.000',
                ),
                const Text(
                  '✅Pilih jangka waktu sesuai kebutuhanmu',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '💬 Jangan biarkan uangmu diam… biarkan dia tumbuh dengan Deposito!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}
