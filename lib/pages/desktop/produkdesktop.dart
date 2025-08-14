import 'package:flutter/material.dart';

class ProdukDesktopPage extends StatelessWidget {
  const ProdukDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'PRODUK',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
            'Produk Tabungan, Deposito, dan Kredit PT. BPR Anak Negeri Papua'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Card(
                elevation: 5,
                color: Colors.black,
                child: Container(
                    height: 300,
                    width: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/produk_tabungan.png',
                            ),
                            fit: BoxFit.cover)),
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'TABUNGAN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                          ),
                        ))),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {},
              child: Card(
                elevation: 5,
                color: Colors.black,
                child: Container(
                  height: 300,
                  width: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kpr.jpg',
                          ),
                          fit: BoxFit.cover)),
                  child: const Center(
                      child: Text(
                    'DEPOSITO',
                    style: TextStyle(color: Colors.black),
                  )),
                ),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {},
              child: Card(
                elevation: 5,
                color: Colors.black,
                child: Container(
                    height: 300,
                    width: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/produk_kredit.png',
                            ),
                            fit: BoxFit.cover)),
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'KREDIT',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ))),
              ),
            )
          ],
        )
      ],
    );
  }
}
