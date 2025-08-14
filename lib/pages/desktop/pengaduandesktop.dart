import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PengaduanNasabahDesktop extends StatefulWidget {
  const PengaduanNasabahDesktop({super.key});

  @override
  State<PengaduanNasabahDesktop> createState() =>
      _PengaduanNasabahDesktopState();
}

class _PengaduanNasabahDesktopState extends State<PengaduanNasabahDesktop> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tglController = TextEditingController();

  String selectedJenis = 'Layanan';
  final List<String> jenisList = [
    'Layanan',
    'Transaksi',
    'Deposito',
    'Tabungan',
    'Kewajiban pada Bank Lain',
    'Kredit Investasi',
    'Kredit Modal Kerja',
    'Kredit Konsumtif',
    'Lainnya'
  ];

  bool loading = false;

  Future<void> kirimPengaduan() async {
    if (namaController.text.isEmpty ||
        nohpController.text.isEmpty ||
        tglController.text.isEmpty ||
        deskripsiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua field')),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final url = Uri.parse('https://api.bankanp.com/pengaduan');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nama': namaController.text,
          'nohp': nohpController.text,
          'tgl': tglController.text
              .split('-')
              .reversed
              .join('-'), // dd-MM-yyyy → yyyy-MM-dd
          'jenis': selectedJenis,
          'deskripsi': deskripsiController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pengaduan berhasil dikirim')),
        );
        // Bersihkan form
        namaController.clear();
        nohpController.clear();
        tglController.clear();
        deskripsiController.clear();
        setState(() {
          selectedJenis = 'Layanan';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal kirim: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengaduan Nasabah'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: isMobile ? double.infinity : 600,
          child: ListView(
            children: [
              const Text(
                'Silakan isi form berikut untuk menyampaikan pengaduan Anda:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Nama
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Nomor HP
              TextField(
                controller: nohpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Tanggal Pengaduan
              TextField(
                controller: tglController,
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(picked);
                    setState(() {
                      tglController.text = formattedDate;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Tanggal Pengaduan',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 15),

              // Jenis Pengaduan
              DropdownButtonFormField<String>(
                value: selectedJenis,
                items: jenisList
                    .map((jenis) => DropdownMenuItem(
                          value: jenis,
                          child: Text(jenis),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedJenis = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Jenis Pengaduan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Deskripsi
              TextField(
                controller: deskripsiController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Pengaduan',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),

              // Tombol Kirim
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: loading ? null : kirimPengaduan,
                  icon: loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.send),
                  label: Text(loading ? 'Mengirim...' : 'Kirim Pengaduan'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
