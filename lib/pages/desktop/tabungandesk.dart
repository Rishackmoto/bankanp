import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/responsivenavbar.dart';

class TabunganDesktop extends StatelessWidget {
  const TabunganDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: ResponsiveNavbar()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Lottie.asset('assets/lottie/car.json',
                      height: MediaQuery.sizeOf(context).height / 1.5),
                ),
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tabungan – Aman, Praktis, Penuh Manfaat dan Bebas Biaya Bulanan!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          'setiap rencana besar dimulai dari langkah kecil. Dengan tabungan, kamu bisa mengatur keuangan lebih rapi, punya dana darurat, dan siap hadapi masa depan',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. TABUMAS - Tabungan Masyarakat',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                            ),
                            Text(
                              '✅Setoran awal Rp. 100.000, setoran selanjutnya minimal Rp. 50.000 ',
                            ),
                            Text(
                              '✅Saldo mengendap Rp. 50.000',
                            ),
                            Text(
                              '✅Suku Bunga 1%',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2. TAPEL - Tabungan Pelajar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan yang berstatus sebagai Pelajar',
                            ),
                            Text(
                              '✅Setoran awal Rp. 20.000, setoran selanjutnya minimal Rp. 10.000 ',
                            ),
                            Text(
                              '✅Saldo mengendap Rp. 10.000',
                            ),
                            Text(
                              '✅Suku Bunga 1%',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. TABUNGAN ANP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                            ),
                            Text(
                              '✅Setoran awal Rp. 50.000.000, setoran selanjutnya minimal Rp. 250.000 ',
                            ),
                            Text(
                              '✅Saldo mengendap Rp. 250.000',
                            ),
                            Text(
                              '✅Suku Bunga 2%',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4. TABUNGAN ABP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah non perorangan yang merupakan lembaga jasa keuangan /bank',
                            ),
                            Text(
                              '✅Setoran awal Rp. 100.000, setoran selanjutnya minimal Rp. 50.000 ',
                            ),
                            Text(
                              '✅Saldo mengendap Rp. 50.000',
                            ),
                            Text(
                              '✅Suku Bunga 1%',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📝 Syarat Pembukaan Rekening',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '✅KTP (atau identitas lainnya)',
                            ),
                            Text(
                              '✅Setoran awal minimum',
                            ),
                            Text(
                                '✅Usia 17 tahun ke atas (atau didampingi orang tua jika di bawah itu)'),
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
