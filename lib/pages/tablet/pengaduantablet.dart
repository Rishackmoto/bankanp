import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan di pubspec.yaml

class PengaduanNasabahTablet extends StatefulWidget {
  const PengaduanNasabahTablet({super.key});

  @override
  State<PengaduanNasabahTablet> createState() => _PengaduanNasabahTabletState();
}

class _PengaduanNasabahTabletState extends State<PengaduanNasabahTablet> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController norekController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengaduan Nasabah'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
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
                  labelText: 'Nama Nasabah',
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
                  onPressed: () {
                    print('--- PENGADUAN DIKIRIM ---');
                    print('Nama: ${namaController.text}');
                    print('No Rek: ${norekController.text}');
                    print('No HP: ${nohpController.text}');
                    print('Tgl: ${tglController.text}');
                    print('Jenis: $selectedJenis');
                    print('Deskripsi: ${deskripsiController.text}');
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Pengaduan'),
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
