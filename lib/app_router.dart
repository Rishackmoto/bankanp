import 'package:go_router/go_router.dart';
import 'package:website/main.dart';
import 'package:website/pages/desktop/homeiklanpenjualandesktop.dart';
import 'package:website/pages/desktop/informasikegiatandesktop.dart';
import 'package:website/pages/desktop/kontakdesktop.dart';
import 'package:website/pages/desktop/laporandesktop.dart';
import 'package:website/pages/desktop/pengaduandesktop.dart';
import 'package:website/pages/desktop/tentangdesktop.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/tentang',
      builder: (context, state) => const TentangDesktop(),
    ),
    GoRoute(
      path: '/kontak',
      builder: (context, state) => const KontakDesktop(),
    ),
    GoRoute(
      path: '/laporan',
      builder: (context, state) => const LaporanDesktop(),
    ),
    GoRoute(
      path: '/pengaduan',
      builder: (context, state) => const PengaduanNasabahDesktop(),
    ),
    GoRoute(
      path: '/lelang',
      builder: (context, state) => const Homeiklanpenjualandesktop(),
    ),
    GoRoute(
      path: '/informasi',
      builder: (context, state) => const InformasiKegiatanDesktop(),
    ),
  ],
);
