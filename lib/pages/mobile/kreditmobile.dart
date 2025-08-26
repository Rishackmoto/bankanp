import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/mobile/navbarmobile.dart';

class KreditMobile extends StatelessWidget {
  const KreditMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: NavbarMobile()),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/home.json',
                    height: MediaQuery.sizeOf(context).height / 2),
                const Text(
                  'Kredit – Jalan Pintas Menuju Impian!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  'Impian besar kadang butuh dorongan nyata. Baik untuk usaha, rumah, atau pendidikan — kami bantu wujudkan',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '💼 Jenis Kredit yang Tersedia:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅ Kredit Usaha – Untuk kamu yang punya UMKM',
                ),
                const Text(
                  '✅ Kredit Konsumtif – Renovasi rumah, beli motor, atau kebutuhan pribadi',
                ),
                const Text(
                  '✅ Kredit Multiguna – Jaminan properti untuk modal tambahan',
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '🎁 Keunggulan Kredit Kami:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅ Proses Cepat & Transparan',
                ),
                const Text(
                  '✅ Cicilan Ringan, Bunga Bersaing',
                ),
                const Text(
                  '✅ Tenor Fleksibel hingga 120 bulan',
                ),
                const Text(
                  '✅ Didampingi Tim Analisa Terpercaya',
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '📝 Syarat Mudah:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅KTP & NPWP',
                ),
                const Text(
                  '✅Slip gaji / bukti penghasilan',
                ),
                const Text(
                  '✅Jaminan (jika dibutuhkan sesuai jenis kredit)',
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '💬 Jangan biarkan impianmu menunggu.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Text(
                  '💬 Kredit kami siap jadi jembatan menuju tujuanmu.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}
