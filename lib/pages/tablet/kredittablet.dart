import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/responsivenavbar.dart';

class KreditTablet extends StatelessWidget {
  const KreditTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: ResponsiveNavbar()),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/home.json',
                  height: MediaQuery.sizeOf(context).height / 3),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kredit – Jalan Pintas Menuju Impian!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Impian besar kadang butuh dorongan nyata. Baik untuk usaha, rumah, atau pendidikan — kami bantu wujudkan',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '💼 Jenis Kredit yang Tersedia:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      '✅ Kredit Usaha – Untuk kamu yang punya UMKM',
                    ),
                    Text(
                      '✅ Kredit Konsumtif – Renovasi rumah, beli motor, atau kebutuhan pribadi',
                    ),
                    Text(
                      '✅ Kredit Multiguna – Jaminan properti untuk modal tambahan',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🎁 Keunggulan Kredit Kami:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      '✅ Proses Cepat & Transparan',
                    ),
                    Text(
                      '✅ Cicilan Ringan, Bunga Bersaing',
                    ),
                    Text(
                      '✅ Tenor Fleksibel hingga 120 bulan',
                    ),
                    Text(
                      '✅ Didampingi Tim Analisa Terpercaya',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📝 Syarat Mudah:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                '✅KTP & NPWP',
              ),
              Text(
                '✅Slip gaji / bukti penghasilan',
              ),
              Text(
                '✅Jaminan (jika dibutuhkan sesuai jenis kredit)',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '💬 Jangan biarkan impianmu menunggu.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                '💬 Kredit kami siap jadi jembatan menuju tujuanmu.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}
