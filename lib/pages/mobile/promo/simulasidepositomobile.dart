import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:website/pages/footerresponsive.dart';

class SimulasiDepositoPageMobile extends StatefulWidget {
  const SimulasiDepositoPageMobile({super.key});

  @override
  State<SimulasiDepositoPageMobile> createState() =>
      _SimulasiDepositoPageMobileState();
}

class _SimulasiDepositoPageMobileState
    extends State<SimulasiDepositoPageMobile> {
  final _formKey = GlobalKey<FormState>();

  double? nominal; // jumlah simpanan awal
  int? tenor; // bulan
  double? bunga; // % per tahun
  double? hasil; // bunga yang didapat
  double? total; // total akhir

  final formatCurrency =
      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0);

  void hitungDeposito() {
    if (nominal != null && tenor != null && bunga != null) {
      int n = tenor!;
      double i = (bunga! / 100) / 12; // bunga per bulan

      // bunga sederhana (flat)
      double bungaDapat = nominal! * i * n;
      double totalAkhir = nominal! + bungaDapat;

      // bisa juga pakai rumus bunga majemuk:
      // double totalAkhir = nominal! * pow(1 + i, n);
      // double bungaDapat = totalAkhir - nominal!;

      setState(() {
        hasil = bungaDapat;
        total = totalAkhir;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/iklandepositopotrait.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nominal Deposito (Rp)",
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
                nominal = double.tryParse(clean);
              },
              validator: (val) =>
                  val == null || val.isEmpty ? "Isi nominal deposito" : null,
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  hitungDeposito();
                }
              },
              child: const Text("Hitung Deposito"),
            ),
            const SizedBox(height: 30),
            if (hasil != null && total != null) ...[
              Text(
                "Bunga didapat: Rp ${formatCurrency.format(hasil)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Total akhir: Rp ${formatCurrency.format(total)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(height: 30),
            const FooterResponsive()
          ],
        ),
      ),
    );
  }
}
