import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final Function(int) onMenuTap;

  const ResponsiveScaffold({
    super.key,
    required this.body,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: const Text("BANK ANP"),
              backgroundColor: Colors.blue,
            ),
      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text("Menu", style: TextStyle(color: Colors.white)),
                  ),
                  _drawerItem("Home", 0),
                  _drawerItem("Tentang Kami", 1),
                  _drawerItem("Laporan", 2),
                  _drawerItem("Informasi", 3),
                  _drawerItem("Pengaduan", 4),
                  _drawerItem("Kontak", 5),
                  _drawerItem("Lelang", 6),
                ],
              ),
            ),
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 200,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  _menuItem("Home", 0),
                  _menuItem("Tentang Kami", 1),
                  _menuItem("Laporan", 2),
                  _menuItem("Informasi", 3),
                  _menuItem("Pengaduan", 4),
                  _menuItem("Kontak", 5),
                  _menuItem("Lelang", 6),
                ],
              ),
            ),
          Expanded(child: body),
        ],
      ),
    );
  }

  Widget _menuItem(String label, int index) {
    return ListTile(
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: () => onMenuTap(index),
    );
  }

  Widget _drawerItem(String label, int index) {
    return ListTile(
      title: Text(label),
      onTap: () => onMenuTap(index),
    );
  }
}
