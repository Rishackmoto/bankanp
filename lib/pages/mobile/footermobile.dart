import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:website/visitor_counter.dart';

class Footermobile extends StatelessWidget {
  const Footermobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ornamen.png'),
          fit: BoxFit.cover,
        ),
        color: Color(0xFFE7321C),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 👇 Flexible agar teks bisa wrap
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PT. BPR Anak Negeri Papua (Persero)',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK). Merupakan peserta penjaminan Lembaga Penjamin Simpanan (LPS).',
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'Jl. Frans Kaisepo Blok C No. 7, Ruko Pasifik Permai, Kota Jayapura, Papua',
                              style: TextStyle(color: Colors.white),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.phone, color: Colors.white),
                          Expanded(
                            child: Text(
                              '0823-1773-9026',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.email, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'bankbpranp@gmail.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SocialMediaButton.facebook(
                                color: Colors.white,
                                size: 30,
                                onTap: () {},
                              ),
                              SocialMediaButton.instagram(
                                color: Colors.white,
                                size: 30,
                                onTap: () {},
                              ),
                              const SocialMediaButton.whatsapp(
                                color: Colors.white,
                                size: 30,
                                url: 'https://wa.me/6282317739026',
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/logobpr.png',
                            scale: 2.2,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      // 👉 ini kita tambahkan
                      const VisitorCounter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
