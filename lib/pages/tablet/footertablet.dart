import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class FooterTablet extends StatelessWidget {
  const FooterTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/ornamen.png'), fit: BoxFit.cover),
        color: Color(0xFFE7321C),
      ),
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logobpr.png',
              scale: 2.2,
            ),
            const SizedBox(width: 30),
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PT. BPR Anak Negeri Papua (Persero)',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        'Berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK) Merupakan peserta penjaminan lembaga Penjamin Simpanan (LPS)',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          'Jl. Frans Kaisepo Blok C No. 7, Ruko Pasifik Permai, Kota Jayapura, Papua',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          '0823-1773-9026',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'bankbpranp@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
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
                const SizedBox(width: 15),
                // 👉 ini kita tambahkan
              ],
            )
          ],
        ),
      ),
    );
  }
}
