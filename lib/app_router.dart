import 'package:go_router/go_router.dart';
import 'package:website/informasiresponsive.dart';
import 'package:website/kontakresponsive.dart';
import 'package:website/laporanresponsive.dart';
import 'package:website/main.dart';
import 'package:website/pages/homeiklanpenjualanresponsive.dart';
import 'package:website/pengaduanresponsive.dart';
import 'package:website/tentangresponsive.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/tentang',
      builder: (context, state) => const TentangResponsive(),
    ),
    GoRoute(
      path: '/kontak',
      builder: (context, state) => const KontakResponsive(),
    ),
    GoRoute(
      path: '/laporan',
      builder: (context, state) => const LaporanResponsive(),
    ),
    GoRoute(
      path: '/pengaduan',
      builder: (context, state) => const PengaduanResponsive(),
    ),
    GoRoute(
      path: '/lelang',
      builder: (context, state) => const HomePenjualanResponsive(),
    ),
    GoRoute(
      path: '/informasi',
      builder: (context, state) => const InformasiResponsive(),
    ),
  ],
);
