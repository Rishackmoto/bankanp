import 'package:flutter/material.dart';

class InfoDesktop1 extends StatelessWidget {
  const InfoDesktop1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lps.png',
              scale: 1.0,
            ),
            const SizedBox(
              width: 30,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('3T SIMPANAN AMAN DIJAMIN LPS',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
                Text('1. Tercatat dalam pembukuan Bank',
                    style: TextStyle(
                      color: Colors.black87,
                    )),
                Text(
                    '2. Tingkat bunga simpanan yang diterima tidak melebihi tingkat bunga penjaminan LPS',
                    style: TextStyle(
                      color: Colors.black87,
                    )),
                Text(
                    '3. Tidak terindikasi melakukan Fraud dan/atau terbukti melakukan fraud (Tindak pidana di bidang PERBANKAN)',
                    style: TextStyle(
                      color: Colors.black87,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
