import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/responsivenavbar.dart';

class TabunganTablet extends StatelessWidget {
  const TabunganTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: ResponsiveNavbar()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Lottie.asset('assets/lottie/car.json',
                  height: MediaQuery.sizeOf(context).height / 3),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tabungan – Aman, Praktis, Penuh Manfaat dan Bebas Biaya Bulanan!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'setiap rencana besar dimulai dari langkah kecil. Dengan tabungan, kamu bisa mengatur keuangan lebih rapi, punya dana darurat, dan siap hadapi masa depan',
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. TABUMAS - Tabungan Masyarakat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                ),
                Text(
                  '✅Setoran awal Rp. 100.000, setoran selanjutnya minimal Rp. 10.000 ',
                ),
                Text(
                  '✅Saldo mengendap Rp. 50.000',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '2. TAPEL - Tabungan Pelajar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan yang berstatus sebagai Pelajar',
                ),
                Text(
                  '✅Setoran awal Rp. 20.000, setoran selanjutnya minimal Rp. 10.000 ',
                ),
                Text(
                  '✅Saldo mengendap Rp. 20.000',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '3. TABUNGAN ANP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                ),
                Text(
                  '✅Setoran awal Rp. 50.000, setoran selanjutnya minimal Rp. 250.000 ',
                ),
                Text(
                  '✅Saldo mengendap Rp. 20.000',
                ),
                Text(
                  '✅Suku Bunga 2%',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '4. TABUNGAN ABP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah non perorangan yang merupakan lembaga jasa keuangan /bank',
                ),
                Text(
                  '✅Setoran awal Rp. 1.000.000, setoran selanjutnya minimal Rp. 10.000 ',
                ),
                Text(
                  '✅Saldo mengendap Rp. 250.000',
                ),
                Text(
                  '✅Suku Bunga 2%',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📝 Syarat Pembukaan Rekening',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  '✅KTP (atau identitas lainnya)',
                ),
                Text(
                  '✅Setoran awal minimum',
                ),
                Text(
                    '✅Usia 17 tahun ke atas (atau didampingi orang tua jika di bawah itu)'),
                SizedBox(
                  height: 10,
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
