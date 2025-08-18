import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TampilanUtamaTablet extends StatelessWidget {
  const TampilanUtamaTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/kotabck.jpg'),
              fit: BoxFit.cover)),
      height: MediaQuery.sizeOf(context).height / 1.5,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/fliesrocket.json',
              fit: BoxFit.contain, width: MediaQuery.sizeOf(context).width / 3),
          const Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kenapa Harus ke Bank?',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  'Karena di bank, uang kamu nggak cuma aman… tapi juga berkembang.',
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  'Manfaat ke Bank? Lebih dari yang Kamu Kira!',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  '💸 Bisa nabung, transaksi, sampai bayar ini-itu dari HP',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  '💼 Butuh modal usaha? Bank siap bantu lewat produk kredit',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  '📊 Mau investasi? Ada deposito yang aman & cuan',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  '🧾 Semua tercatat rapi, nggak ribet urus keuangan',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
