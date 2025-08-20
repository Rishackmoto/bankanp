import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miss/loginpagedesk.dart';
import 'package:miss/pages/desktop/desktophome.dart';
import 'package:miss/pages/mobile/mobilehome.dart';
import 'package:miss/pages/tablet/tablethome.dart';
import 'package:miss/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/halaman_utaman': (context) => const HomePage(),
        // '/template': (context) => const TemplatePage(title: 'Halaman Baru'),
      },
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
