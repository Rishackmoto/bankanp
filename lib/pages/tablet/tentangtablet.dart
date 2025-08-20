import 'package:flutter/material.dart';
import 'package:miss/pages/footerresponsive.dart';
import 'package:miss/pages/responsivenavbar.dart';

class TentangTablet extends StatelessWidget {
  const TentangTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: ResponsiveNavbar()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/kantorpusat.jpeg',
                height: MediaQuery.sizeOf(context).height / 2,
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tentang kami',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'BPR Anak Negeri Papua,  Teman Finansialmu yang Bisa Diandalkan',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Dibentuk dari semangat untuk melayani dan tumbuh bersama masyarakat, BPR Anak Negeri Papua resmi berdiri pada 15 Juli 2016 dan mulai beroperasi 17 September 2017 di Kota Jayapura, Papua. Sejak awal, kami berkomitmen menjadi lembaga keuangan yang mudah diakses, dekat dengan nasabah, dan punya semangat muda untuk terus berinovasi.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Dengan legalitas resmi dan pengawasan dari Otoritas Jasa Keuangan (OJK), kami terus membuktikan diri sebagai BPR yang transparan, aman, dan relevan di era digital seperti sekarang.',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '🎯 Visi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Menjadi BPR Besar, Sehat, Kuat Terpercaya dan Berpengaruh di Tanah Papua,Penggerak utama ekonomi masyarakat papua',
                      ),
                      Text(
                        '📌 Misi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Memaksimalkan seluruh nilai dan potensi stakeholder untuk menyediakan akses keuangan bagi masyarat Papua',
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Terus berinovasi seiring perkembangan pasar dan kebutuhan Nasabah BANK ANP yang unggul dan diperhitungkan',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  '👥 Susunan Pengurus',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  'Kami percaya bahwa kepemimpinan yang solid adalah fondasi utama dalam membangun kepercayaan. Berikut adalah jajaran pengurus utama BPR Anak Negeri Papua:',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    children: [
                      _buildTableRow('Komisaris Utama', 'AGUSTHINA THENU'),
                      _buildTableRow('Komisaris', 'JOSINA LAWALATA'),
                      _buildTableRow('Direktur Utama', 'VERASISCA NAINGGOLAN'),
                      _buildTableRow(
                          'Direktur Operasional', 'TONGGOR MANAHAN NAPITUPULU'),
                      _buildTableRow(
                          'Direktur Kepatuhan', 'CAROLINA SUSTIANA SIUS'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '🤝 Pemegang Saham',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  'BPR Anak Negeri Papua dimiliki oleh individu dan/atau lembaga yang memiliki komitmen kuat dalam mendukung pengembangan ekonomi kerakyatan, antara lain:',
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    children: [
                      _buildTableRow(
                          'Pemegang Saham Pengendali', 'LEDRYK J. LEKENILA'),
                      _buildTableRow(
                          'Pemegang Saham', 'GKI SINODE DI TANAH PAPUA'),
                      _buildTableRow('Pemegang Saham', 'SAKTIANTA DWANGKARA'),
                      _buildTableRow(
                          'Pemegang Saham', 'CAROLINA SUSTIANA SIUS'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📊 Struktur Organisasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Image.asset('assets/images/organisation.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}

TableRow _buildTableRow(String label, String value, {bool isHeader = false}) {
  return TableRow(
    decoration: BoxDecoration(
      color: isHeader ? Colors.blue.shade50 : Colors.white,
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Colors.blue.shade800 : Colors.black87,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          ': $value',
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
      ),
    ],
  );
}
