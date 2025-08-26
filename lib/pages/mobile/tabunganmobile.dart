import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/mobile/navbarmobile.dart';

class TabunganMobile extends StatelessWidget {
  const TabunganMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: NavbarMobile()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/car.json',
                    height: MediaQuery.sizeOf(context).height / 1.5),
                const Text(
                  'Tabungan – Aman, Praktis, Penuh Manfaat dan Bebas Biaya Bulanan!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  'setiap rencana besar dimulai dari langkah kecil. Dengan tabungan, kamu bisa mengatur keuangan lebih rapi, punya dana darurat, dan siap hadapi masa depan',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '1. TABUMAS - Tabungan Masyarakat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                ),
                const Text(
                  '✅Setoran awal Rp. 100.000, setoran selanjutnya minimal Rp. 50.000 ',
                ),
                const Text(
                  '✅Saldo mengendap Rp. 50.000',
                ),
                const Text(
                  '✅Suku Bunga 1%',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '2. TAPEL - Tabungan Pelajar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan yang berstatus sebagai Pelajar',
                ),
                const Text(
                  '✅Setoran awal Rp. 20.000, setoran selanjutnya minimal Rp. 10.000 ',
                ),
                const Text(
                  '✅Saldo mengendap Rp. 10.000',
                ),
                const Text(
                  '✅Suku Bunga 1%',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '3. TABUNGAN ANP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah perorangan dan non perorangan',
                ),
                const Text(
                  '✅Setoran awal Rp. 50.000.000, setoran selanjutnya minimal Rp. 250.000 ',
                ),
                const Text(
                  '✅Saldo mengendap Rp. 250.000',
                ),
                const Text(
                  '✅Suku Bunga 2%',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '4. TABUNGAN ABP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅Tabungan dengan mata uang rupiah yang diberikan kepada nasabah non perorangan yang merupakan lembaga jasa keuangan /bank',
                ),
                const Text(
                  '✅Setoran awal Rp. 100.000, setoran selanjutnya minimal Rp. 50.000 ',
                ),
                const Text(
                  '✅Saldo mengendap Rp. 50.000',
                ),
                const Text(
                  '✅Suku Bunga 1%',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '📝 Syarat Pembukaan Rekening',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  '✅KTP (atau identitas lainnya)',
                ),
                const Text(
                  '✅Setoran awal minimum',
                ),
                const Text(
                    '✅Usia 17 tahun ke atas (atau didampingi orang tua jika di bawah itu)')
              ],
            ),
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}
