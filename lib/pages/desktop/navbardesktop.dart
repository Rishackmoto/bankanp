import 'package:flutter/material.dart';
import 'package:website/main.dart';

import 'package:website/pages/desktop/tentangdesktop.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ornamen.png'),
              fit: BoxFit.cover,
              opacity: 0.6),
          color: Color(0xFF122F56)),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Image.asset(
              'assets/images/anp_white.png',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
          ),
          Row(
            children: [
              HoverText(
                label: 'Tentang kami',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TentangDesktop(),
                      ));
                },
              ),
              const SizedBox(width: 20),
              const HoverText(label: 'Produk dan Layanan'),
              const SizedBox(width: 20),
              const HoverText(label: 'Laporan'),
              const SizedBox(width: 20),
              const HoverText(label: 'Berita dan Informasi'),
              const SizedBox(width: 20),
              const HoverText(label: 'Pengaduan'),
              const SizedBox(width: 20),
              const HoverText(label: 'Kontak kami'),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  const HoverText({super.key, required this.label, this.onTap});

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap, // ✅ FIXED: Panggil onTap dari parameter
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isHovering ? Colors.yellow : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
          child: Text(
            widget.label,
          ),
        ),
      ),
    );
  }
}
