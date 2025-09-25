import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:website/pages/footerresponsive.dart';

// class model untuk baris tabel
class Angsuran {
  final int bulan;
  final double pokok;
  final double bunga;
  final double total;
  final double sisa;

  Angsuran(this.bulan, this.pokok, this.bunga, this.total, this.sisa);
}

class SimulasiKreditPageTablet extends StatefulWidget {
  const SimulasiKreditPageTablet({super.key});

  @override
  State<SimulasiKreditPageTablet> createState() =>
      _SimulasiKreditPageTabletState();
}

class _SimulasiKreditPageTabletState extends State<SimulasiKreditPageTablet> {
  final _formKey = GlobalKey<FormState>();

  double? pinjaman;
  int? tenor; // bulan
  double? bunga; // % per tahun
  double? hasil;

  String metode = 'Anuitas'; // default metode

  final formatCurrency =
      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0);

  List<Angsuran> rincian = [];

  void hitungAngsuran() {
    rincian.clear();

    if (pinjaman != null && tenor != null && bunga != null) {
      int n = tenor!;
      double i = (bunga! / 100) / 12;
      double sisa = pinjaman!;

      if (metode == 'Anuitas') {
        double angsuranBulanan =
            pinjaman! * (i * pow(1 + i, n)) / (pow(1 + i, n) - 1);
        hasil = angsuranBulanan;

        for (int bulan = 1; bulan <= n; bulan++) {
          double bungaBulan = sisa * i;
          double pokokBulan = angsuranBulanan - bungaBulan;
          sisa -= pokokBulan;
          rincian.add(Angsuran(bulan, pokokBulan, bungaBulan, angsuranBulanan,
              sisa < 0 ? 0 : sisa));
        }
      } else if (metode == 'Flat') {
        double pokokPerBulan = pinjaman! / n;
        double bungaPerBulan = pinjaman! * (bunga! / 100) / 12;
        double totalPerBulan = pokokPerBulan + bungaPerBulan;
        hasil = totalPerBulan;

        for (int bulan = 1; bulan <= n; bulan++) {
          sisa -= pokokPerBulan;
          rincian.add(Angsuran(bulan, pokokPerBulan, bungaPerBulan,
              totalPerBulan, sisa < 0 ? 0 : sisa));
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // sisi kiri gambar
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/bropotrait.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                // sisi kanan form + hasil
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          validator: (val) => val == null || val.isEmpty
                              ? "Isi jumlah pinjaman"
                              : null,
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
                        // Dropdown untuk pilih metode
                        DropdownButtonFormField<String>(
                          initialValue: metode,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Metode Perhitungan",
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: 'Anuitas', child: Text('Anuitas')),
                            DropdownMenuItem(
                                value: 'Flat', child: Text('Flat')),
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
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              hitungAngsuran();
                            }
                          },
                          child: const Text("Hitung Angsuran"),
                        ),
                        const SizedBox(height: 30),
                        if (hasil != null)
                          Text(
                            "Angsuran per bulan: Rp ${formatCurrency.format(hasil)}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(height: 30),
                        if (rincian.isNotEmpty)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Bulan')),
                                DataColumn(label: Text('Pokok')),
                                DataColumn(label: Text('Bunga')),
                                DataColumn(label: Text('Total')),
                                DataColumn(label: Text('Sisa')),
                              ],
                              rows: rincian.map((row) {
                                return DataRow(cells: [
                                  DataCell(Text(row.bulan.toString())),
                                  DataCell(
                                      Text(formatCurrency.format(row.pokok))),
                                  DataCell(
                                      Text(formatCurrency.format(row.bunga))),
                                  DataCell(
                                      Text(formatCurrency.format(row.total))),
                                  DataCell(
                                      Text(formatCurrency.format(row.sisa))),
                                ]);
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const FooterResponsive()
          ],
        ),
      ),
    );
  }
}
