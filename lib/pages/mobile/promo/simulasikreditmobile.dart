import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:website/pages/footerresponsive.dart';

class SimulasiKreditPageMobile extends StatefulWidget {
  const SimulasiKreditPageMobile({super.key});

  @override
  State<SimulasiKreditPageMobile> createState() =>
      _SimulasiKreditPageMobileState();
}

class _SimulasiKreditPageMobileState extends State<SimulasiKreditPageMobile> {
  final _formKey = GlobalKey<FormState>();

  double? pinjaman;
  int? tenor; // bulan
  double? bunga; // % per tahun
  double? hasil; // angsuran per bulan

  String metode = 'Anuitas'; // default metode

  final formatCurrency =
      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0);

  List<Map<String, dynamic>> rincian = []; // tabel detail per bulan

  void hitungAngsuran() {
    rincian.clear();
    if (pinjaman != null && tenor != null && bunga != null) {
      int n = tenor!;
      double i = (bunga! / 100) / 12;

      if (metode == 'Anuitas') {
        // rumus anuitas total per bulan
        double annuitas = pinjaman! * (i * pow(1 + i, n)) / (pow(1 + i, n) - 1);
        hasil = annuitas;

        double sisaPokok = pinjaman!;
        for (int bulan = 1; bulan <= n; bulan++) {
          double bungaBulan = sisaPokok * i;
          double pokokBulan = annuitas - bungaBulan;
          sisaPokok -= pokokBulan;
          rincian.add({
            'bulan': bulan,
            'pokok': pokokBulan,
            'bunga': bungaBulan,
            'total': annuitas,
          });
        }
      } else if (metode == 'Flat') {
        double pokokPerBulan = pinjaman! / n;
        double bungaPerBulan = pinjaman! * (bunga! / 100) / 12;
        hasil = pokokPerBulan + bungaPerBulan;

        for (int bulan = 1; bulan <= n; bulan++) {
          rincian.add({
            'bulan': bulan,
            'pokok': pokokPerBulan,
            'bunga': bungaPerBulan,
            'total': pokokPerBulan + bungaPerBulan,
          });
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulasi Kredit')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/bropotrait.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Jumlah Pinjaman (Rp)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: '',
                  ),
                ],
                onChanged: (val) {
                  String clean = val.replaceAll('.', '');
                  pinjaman = double.tryParse(clean);
                },
                validator: (val) =>
                    val == null || val.isEmpty ? "Isi jumlah pinjaman" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Tenor (bulan)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) => tenor = int.tryParse(val),
                validator: (val) =>
                    val == null || val.isEmpty ? "Isi tenor" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Bunga (% per tahun)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) => bunga = double.tryParse(val),
                validator: (val) =>
                    val == null || val.isEmpty ? "Isi bunga" : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: metode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Metode Perhitungan",
                ),
                items: const [
                  DropdownMenuItem(value: 'Anuitas', child: Text('Anuitas')),
                  DropdownMenuItem(value: 'Flat', child: Text('Flat')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      metode = val;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      hitungAngsuran();
                    }
                  },
                  child: const Text("Hitung Angsuran"),
                ),
              ),
              const SizedBox(height: 30),

              if (hasil != null)
                Text(
                  "Angsuran per bulan (total): Rp ${formatCurrency.format(hasil)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),

              // Tabel rincian
              if (rincian.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'Rincian Angsuran per Bulan:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Bulan')),
                      DataColumn(label: Text('Pokok')),
                      DataColumn(label: Text('Bunga')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: rincian
                        .map(
                          (r) => DataRow(cells: [
                            DataCell(Text(r['bulan'].toString())),
                            DataCell(Text(
                                formatCurrency.format(r['pokok'].round()))),
                            DataCell(Text(
                                formatCurrency.format(r['bunga'].round()))),
                            DataCell(Text(
                                formatCurrency.format(r['total'].round()))),
                          ]),
                        )
                        .toList(),
                  ),
                ),
              ],

              const SizedBox(height: 30),
              const FooterResponsive()
            ],
          ),
        ),
      ),
    );
  }
}
