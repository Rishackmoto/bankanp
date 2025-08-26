import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ buat rootBundle
import 'package:lottie/lottie.dart';
import 'package:website/pages/desktop/detailinformasidesktop.dart';
import 'package:website/pages/footerresponsive.dart';
import 'package:website/pages/mobile/navbarmobile.dart';

class InformasiKegiatanMobile extends StatefulWidget {
  const InformasiKegiatanMobile({super.key});

  @override
  State<InformasiKegiatanMobile> createState() =>
      _InformasiKegiatanMobileState();
}

class _InformasiKegiatanMobileState extends State<InformasiKegiatanMobile> {
  String selectedCategory = "Semua";
  List<dynamic> jaminanList = [];

  @override
  void initState() {
    super.initState();
    loadJaminanData();
  }

  // 🔎 Load JSON dari assets/json
  Future<void> loadJaminanData() async {
    final String response =
        await rootBundle.loadString('assets/json/informasi.json');
    final data = json.decode(response);

    setState(() {
      jaminanList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🔎 Filter data sesuai kategori
    final filteredList = selectedCategory == "Semua"
        ? jaminanList
        : jaminanList
            .where((item) => item["category"] == selectedCategory)
            .toList();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: NavbarMobile(),
      ),
      body: jaminanList.isEmpty
          ? const Center(child: CircularProgressIndicator()) // loading dulu
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Bagian Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lottie/news.json',
                        height: MediaQuery.sizeOf(context).height / 2.2,
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Temukan Berita, Dapatkan Inspirasi! ✨',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                textAlign: TextAlign.justify,
                                'TJangan lewatkan update terbaru seputar layanan, promo, dan tips keuangan.',
                              ),
                              Text(
                                textAlign: TextAlign.justify,
                                'Klik, baca, dan bagikan informasi penting ini ke orang-orang yang perlu tahu!',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 🔎 Filter kategori
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      "Semua",
                      "Informasi",
                      "Berita",
                      "Kegiatan",
                    ].map((cat) {
                      return ChoiceChip(
                        label: Text(cat),
                        selected: selectedCategory == cat,
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = cat;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // Grid Daftar Jaminan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 3; // default desktop
                        if (constraints.maxWidth < 600) {
                          crossAxisCount = 1; // mobile
                        } else if (constraints.maxWidth < 1100) {
                          crossAxisCount = 2; // tablet
                        } else if (constraints.maxWidth > 1100) {
                          crossAxisCount = 4; // layar besar
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 4 / 5,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final item = filteredList[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4,
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: item["image"]
                                            .toString()
                                            .startsWith("http")
                                        ? Image.network(
                                            item["image"],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          )
                                        : Image.asset(
                                            item["image"],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["title"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Tgl. Kegiatan: ${item["tgl"]}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailInformasi(
                                                  title: item["title"],
                                                  tgl: item["tgl"],
                                                  desc: item["desc"],
                                                  images: List<String>.from(
                                                      item["images"]),
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF122F56),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            "Lihat Detail",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                  const FooterResponsive(),
                ],
              ),
            ),
    );
  }
}
