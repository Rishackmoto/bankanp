import 'package:flutter/material.dart';

class HomeIklanPenjualanDesktop extends StatelessWidget {
  const HomeIklanPenjualanDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 600),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/umkm.jpg',
                  scale: 20,
                ),
                const SizedBox(width: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Di Jual Tanah Kosong, Koya Barat'),
                    Text(
                      'Luas tanah 3.650 M2, cocok untuk usaha maupun perkebunan',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/umkm.jpg',
                  scale: 20,
                ),
                const SizedBox(width: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Di Jual Tanah Kosong, Koya Barat'),
                    Text(
                      'Luas tanah 3.650 M2, cocok untuk usaha maupun perkebunan',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
