import 'package:flutter/material.dart';
import 'package:miss/pages/desktop/footerdesktop.dart';

import 'package:miss/pages/desktop/navbardesktop.dart';

class TentangDesktopold extends StatelessWidget {
  const TentangDesktopold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: NavbarDesktop()),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.4,
          image: AssetImage('assets/images/ornamen.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFE7321C),
                          image: DecorationImage(
                              image: AssetImage('assets/images/ornamen.png'),
                              fit: BoxFit.cover),
                        ),
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Tentang kami',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          'Kami adalah lembaga keuangan yang berdedikasi untuk menjadi mitra terpercaya dalam perjalanan finansial Anda. Sejak berdiri 15 Juli 2016 berdasarkan Akta Pendirian No. 9 dan beroperasi sejak tanggal 17 September 2017, kami berkomitmen memberikan pelayanan terbaik, produk yang relevan, serta solusi keuangan yang aman, cepat, dan mudah dijangkau oleh seluruh lapisan masyarakat.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 4.5,
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFE7321C),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/ornamen.png'),
                                    fit: BoxFit.cover),
                              ),
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'Visi',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                textAlign: TextAlign.justify,
                                'Menjadi BPR Besar, Sehat, Kuat Terpercaya dan Berpengaruh di Tanah Papua',
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                textAlign: TextAlign.justify,
                                'Penggerak utama ekonomi masyarakat papua',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 4.5,
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFE7321C),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/ornamen.png'),
                                    fit: BoxFit.cover),
                              ),
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'Misi',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                textAlign: TextAlign.justify,
                                'Memaksimalkan seluruh nilai dan potensi stakeholder untuk menyediakan akses keuangan bagi masyarat Papua',
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                textAlign: TextAlign.justify,
                                'Terus berinovasi seiring perkembangan pasar dan kebutuhan Nasabah BANK ANP yang unggul dan diperhitungkan',
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                textAlign: TextAlign.justify,
                                'Menjalankan usaya yang Pruden sesuai regulasi dan ketentuan yang berlaku',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFE7321C),
                          image: DecorationImage(
                              image: AssetImage('assets/images/ornamen.png'),
                              fit: BoxFit.cover),
                        ),
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Slogan',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Text(
                        textAlign: TextAlign.justify,
                        'BANK BPR Anak Negeri Papua memberikan pelayanan terbaik yang Bersih, Indah, Sehat dan  Aman kepada nasabah dan calon nasabah',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              const Footerdesktop(),
            ],
          ),
        ),
      ),
    );
  }
}
