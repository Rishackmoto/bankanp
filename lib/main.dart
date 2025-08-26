import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/pages/desktop/desktophome.dart';
import 'package:website/pages/mobile/mobilehome.dart';
import 'package:website/pages/tablet/tablethome.dart';
import 'package:website/responsive.dart';
import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BANK ANP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      routerConfig: router,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktopLayout: HomePageDesktop(),
      mobileLayout: HomePageMobile(),
      tabletLayout: TabletHomePage(),
    );
  }
}
