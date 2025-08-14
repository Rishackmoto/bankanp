import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/desktop/kreditdesk.dart';
import 'package:website/pages/tablet/depositotablet.dart';
import 'package:website/pages/tablet/kontaktablet.dart';
import 'package:website/pages/tablet/kredittablet.dart';
import 'package:website/pages/tablet/laporantablet.dart';
import 'package:website/pages/tablet/pengaduantablet.dart';
import 'package:website/pages/tablet/tabungantablet.dart';
import 'package:website/pages/tablet/tentangtablet.dart';

class ListInformasiTablet extends StatelessWidget {
  const ListInformasiTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDE33B),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Row(
                          children: [
                            Lottie.asset('assets/lottie/car.json',
                                height: MediaQuery.sizeOf(context).height / 3),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Simpan Sekarang, Nikmati Nanti',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Punya rencana besar? Yuk mulai dari langkah kecil!',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '📌 Fitur unggulan:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '  1. Setoran awal ringan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '  2. Bebas biaya bulanan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '  3. Dapat bunga menarik!',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFE7321C)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TabunganTablet(),
                                              ));
                                        },
                                        child: const Text(
                                          'Selengkapnya',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/tabungan.png'),
                  const Text(
                    'TABUNGAN',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Lottie.asset('assets/lottie/meditation.json',
                            height: MediaQuery.sizeOf(context).height / 3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Diam sTapi Tumbuh',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '#DepositoPasti #CuanTanpaRisiko',
                            ),
                            const Text(
                              'Uangnya diam? Iya. Tapi bunganya jalan terus!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '📌 Keunggulan:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '  1. Bunga tinggi & stabil',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '  2. Jangka waktu fleksibel (1 – 12 bulan)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '  3. Dijamin LPS*',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFE7321C)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DepositoTablet(),
                                        ));
                                  },
                                  child: const Text(
                                    'Selengkapnya',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/timer.png'),
                  const Text(
                    'DEPOSITO',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        Lottie.asset('assets/lottie/home.json',
                            height: MediaQuery.sizeOf(context).height / 3),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jalan Pintas Menuju Impian',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Mau rumah, usaha, atau kendaraan? Gampang!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '📌 Keunggulan:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '  1. Proses cepat, syarat gampang',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '  2. Cicilan ringan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '  3. Tenor bisa disesuaikan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '  4. Layanan ramah & profesional',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xFFE7321C)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const KreditTablet(),
                                          ));
                                    },
                                    child: const Text(
                                      'Selengkapnya',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/credit.png'),
                  const Text(
                    'KREDIT',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Row(
                          children: [
                            Lottie.asset('assets/lottie/reportfinance.json',
                                height: MediaQuery.sizeOf(context).height / 3),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Transparansi adalah hal penting dari pelayanan kami',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'kamu bisa melihat dan mengunduh laporan resmi dari kami',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '📌 Jenis Laporan:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '✅Laporan Triwulan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '✅Pelaksanaan Tata Kelola',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '✅Laporan Berkelanjutan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '✅Laporan Pengaduan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFE7321C)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LaporanTablet(),
                                              ));
                                        },
                                        child: const Text(
                                          'Selengkapnya',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/report.png'),
                  const Text(
                    'LAPORAN',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KreditDesktop(),
                    ));
              },
              child: Column(
                children: [
                  Image.asset('assets/images/news.png'),
                  const Text(
                    'INFO & BERITA',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/lottie/worker.json',
                                height: MediaQuery.sizeOf(context).height / 3),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Kami, BPR Masa Kini',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    'Di era serba digital, kami hadir bukan sekadar jadi tempat simpan pinjam. Tapi jadi partner keuangan kamu yang ngerti kebutuhanmu, support impianmu, dan bantu kamu tumbuh bareng.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    'Kami adalah BPR yang siap berkembang bersama generasi yang melek finansial, aktif, dan peduli masa depan.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFE7321C)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TentangTablet(),
                                              ));
                                        },
                                        child: const Text(
                                          'Selengkapnya',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/tentang.png'),
                  const Text(
                    'TENTANG',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Row(
                          children: [
                            Lottie.asset('assets/lottie/complaint.json',
                                height: MediaQuery.sizeOf(context).height / 3),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Kami Mendengar, Kami Peduli 💙',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    'Suara Anda sangat berarti bagi kami.Laporkan kendala atau keluhan Anda di sini, dan tim kami siap membantu menemukan solusi terbaik untuk Anda.',
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFE7321C)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PengaduanNasabahTablet(),
                                              ));
                                        },
                                        child: const Text(
                                          'Selengkapnya',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/pengaduan.png'),
                  const Text(
                    'PENGADUAN',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      actions: [
                        Row(
                          children: [
                            Lottie.asset('assets/lottie/contactus.json',
                                height: MediaQuery.sizeOf(context).height / 3),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Kami, BPR Masa Kini',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    'Apabila Anda memiliki pertanyaan, masukan, atau membutuhkan informasi lebih lanjut mengenai layanan Bank Perekonomian Rakyat kami, jangan ragu untuk menghubungi.',
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFE7321C)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const KontakTablet(),
                                              ));
                                        },
                                        child: const Text(
                                          'Selengkapnya',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/contact.png'),
                  const Text(
                    'KONTAK',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
