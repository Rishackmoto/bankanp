import 'package:flutter/material.dart';
import 'package:website/pages/mobile/homeiklanpenjualanmobile.dart';
import 'package:website/pages/mobile/informasikegiatanmobile.dart';
import 'package:website/pages/mobile/kontakmobilde.dart';
import 'package:website/pages/mobile/laporanmobile.dart';
import 'package:website/pages/mobile/loginmobile.dart';
import 'package:website/pages/mobile/pengaduanmobile.dart';
import 'package:website/pages/mobile/tentangmobile.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: const Image(
        image: AssetImage('assets/images/ornamen.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: const Color(0xFF122F56),
      foregroundColor: Colors.white,
      title: InkWell(
        child: Image.asset(
          'assets/images/anp_white.png',
          scale: 9,
        ),
        onTap: () {
          Navigator.pop(context); // tutup dialog / halaman sekarang
        },
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {
            // Tambahkan navigasi sesuai pilihan
            if (value == 'Tentang') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TentangMobile()));
            } else if (value == 'Laporan') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaporanMobile()));
            } else if (value == 'Berita & Informasi') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformasiKegiatanMobile()));
            } else if (value == 'Pengaduan') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengaduanNasabahMobile()));
            } else if (value == 'Kontak') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KontakMobile()));
            } else if (value == 'Lelang/Jual') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Homeiklanpenjualanmobile()));
            } else if (value == 'Login') {
              Navigator.push(
                  context,
                  (MaterialPageRoute(
                      builder: (context) => const LoginMISSMobile())));
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'Tentang', child: Text('Tentang Kami')),
            // const PopupMenuItem(value: 'Produk', child: Text('Produk')),
            const PopupMenuItem(value: 'Laporan', child: Text('Laporan')),
            const PopupMenuItem(value: 'Berita', child: Text('Berita')),
            const PopupMenuItem(value: 'Pengaduan', child: Text('Pengaduan')),
            const PopupMenuItem(value: 'Kontak', child: Text('Kontak')),
            const PopupMenuItem(
                value: 'Lelang/Jual', child: Text('Lelang/Jual')),
            const PopupMenuItem(value: 'Login', child: Text('Login')),
          ],
        ),
      ],
    );
  }
}
