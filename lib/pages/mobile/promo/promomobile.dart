import 'package:flutter/material.dart';
import 'package:website/pages/mobile/promo/promoaydamobile.dart';
import 'package:website/pages/mobile/promo/simulasidepositomobile.dart';
import 'package:website/pages/mobile/promo/simulasikreditmobile.dart';

class PromoMobile extends StatelessWidget {
  const PromoMobile({super.key});

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
                  SimulasiDepositoPageMobile(), // tab 1
                  SimulasiKreditPageMobile(), // tab 2
                  PromoAydaMobile(), // tab 3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoTabunganDepositoMobile extends StatelessWidget {
  const PromoTabunganDepositoMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/iklandepositopotrait.png',
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
