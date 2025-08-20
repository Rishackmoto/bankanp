import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/pdfiframeviewer.dart';
import 'package:website/pages/responsivenavbar.dart';

class LaporanTablet extends StatelessWidget {
  const LaporanTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ResponsiveNavbar(),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Lottie.asset(
                                'assets/lottie/reportfinance.json',
                                height: MediaQuery.of(context).size.height / 2,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              flex: 2,
                              child: _Deskripsi(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const TabBar(
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(icon: Icon(Icons.monitor), text: 'TRIWULAN'),
                            Tab(icon: Icon(Icons.gavel), text: 'TATA KELOLA'),
                            Tab(icon: Icon(Icons.eco), text: 'BERKELANJUTAN'),
                            Tab(icon: Icon(Icons.feedback), text: 'PENGADUAN'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(
                          height: 500,
                          child: TabBarView(
                            children: [
                              _ListLaporan([
                                {
                                  'tahun': '2025',
                                  'judul': 'Triwulan I',
                                  'pdf':
                                      'https://file.rishackmoto.com/files/TW12025.pdf'
                                },
                                {
                                  'tahun': '2025',
                                  'judul': 'Triwulan II',
                                  'pdf':
                                      'https://file.rishackmoto.com/files/TW22025.pdf'
                                },
                                {
                                  'tahun': '2025',
                                  'judul': 'Triwulan III',
                                  'pdf': 'https://example.com/triwulan2.pdf'
                                },
                              ]),
                              _ListLaporan([
                                {
                                  'tahun': '2025',
                                  'judul': 'Tata Kelola 2025',
                                  'pdf':
                                      'https://example.com/tatakelola2023.pdf'
                                },
                              ]),
                              _ListLaporan([
                                {
                                  'tahun': '2025',
                                  'judul': 'Laporan Berkelanjutan',
                                  'pdf':
                                      'https://example.com/berkelanjutan2022.pdf'
                                },
                              ]),
                              _ListLaporan([
                                {
                                  'tahun': '2025',
                                  'judul': 'Rekap Pengaduan',
                                  'pdf': 'https://example.com/pengaduan2023.pdf'
                                },
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const FooterResponsive()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === Deskripsi Teks ===
class _Deskripsi extends StatelessWidget {
  const _Deskripsi();

  @override
  Widget build(BuildContext context) {
    return const Text(
      textAlign: TextAlign.justify,
      'Sebagais bentuk komitmen kami terhadap keterbukaan informasi dan tanggung jawab kepada seluruh pemangku kepentingan, Bank Perekenomonian Rakyat (BPR) secara rutin mempublikasikan laporan keuangan dan kinerja perusahaan.',
      style: TextStyle(fontSize: 20),
    );
  }
}

// === Widget List Laporan ===
class _ListLaporan extends StatelessWidget {
  final List<Map<String, String>> data;

  const _ListLaporan(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('${item['judul']} - ${item['tahun']}'),
            trailing: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onTap: () {
              final pdfUrl = item['pdf'];
              if (pdfUrl != null && pdfUrl.startsWith('https')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPreviewPage(pdfUrl: pdfUrl),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link PDF tidak tersedia.')),
                );
              }
            },
          ),
        );
      },
    );
  }
}
