import 'package:flutter/material.dart';
import 'package:website/pages/desktop/promo/promoayda.dart';
import 'package:website/pages/desktop/promo/simulasideposito.dart';
import 'package:website/pages/desktop/promo/simulasikreditdesktop.dart';

class PromoDesktop extends StatelessWidget {
  const PromoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // jumlah tab
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF122F56),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ornamen.png'),
                opacity: 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'PROMO DEPOSITO'),
              Tab(text: 'PROMO KREDIT'),
              Tab(text: 'AYDA'),
            ],
          ),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  SimulasiDepositoPageDesktop(), // tab 1
                  SimulasiKreditPage(), // tab 2
                  PromoAydaDesktop(), // tab 3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoTabunganDeposito extends StatelessWidget {
  const PromoTabunganDeposito({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/iklandepositolandscape.png',
          ),
        ],
      ),
    );
  }
}

class PromoAyda extends StatelessWidget {
  const PromoAyda({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promo AYDA',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            '📣 Penawaran menarik untuk AYDA …',
          ),
        ],
      ),
    );
  }
}
