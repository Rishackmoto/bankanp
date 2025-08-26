import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/pages/mobile/loginmobile.dart';
import 'package:website/pages/tablet/homeiklanpenjualantablet.dart';
import 'package:website/pages/tablet/kontaktablet.dart';
import 'package:website/pages/tablet/laporantablet.dart';
import 'package:website/pages/tablet/pengaduantablet.dart';
import 'package:website/pages/tablet/tentangtablet.dart';

class NavbarTablet extends StatelessWidget {
  const NavbarTablet({super.key});

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
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
                      builder: (context) => const TentangTablet()));
            } else if (value == 'Laporan') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaporanTablet()));
            } else if (value == 'Berita') {
            } else if (value == 'Pengaduan') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengaduanNasabahTablet()));
            } else if (value == 'Kontak') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KontakTablet()));
            } else if (value == 'Lelang/Jual') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Homeiklanpenjualantablet()));
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
