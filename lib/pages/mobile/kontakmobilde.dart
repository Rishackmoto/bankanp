import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/pages/footerresponsive.dart';
import 'dart:ui_web' as ui;
import 'dart:html';

import 'package:website/pages/responsivenavbar.dart';

class KontakMobile extends StatelessWidget {
  const KontakMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: ResponsiveNavbar()),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Lottie.asset(
            'assets/lottie/contactus.json',
            height: MediaQuery.sizeOf(context).height / 2,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hubungi Kami',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Kami selalu siap membantu Anda.',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Apabila Anda memiliki pertanyaan, masukan, atau membutuhkan informasi lebih lanjut mengenai layanan Bank Perkreditan Rakyat kami, jangan ragu untuk menghubungi kami melalui kanal berikut:',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📍 Kantor Pusat:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Jl. Frans kaisepo Blok C No. 7 Ruko Pasific Permai,Kota Jayapura - Papua',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📞 Telepon:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Hp. : 082317739026',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📧 Email Layanan Nasabah:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'kp.jayapura@bankanp.com',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '🌐 Website Resmi:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'www.bankanp.com',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '🕒 Jam Operasional:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Senin – Jumat: 08.00 – 17.00 WIT',
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '📍 Kantor Cabang Merauke:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Jl. Raya Mandala Muli No. 90, Samping Kantor BPJS Ketenagakerjaan, Kota Merauke - Papua Selatan',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📞 Telepon:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Hp : 0821 9911 6191',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📧 Email Layanan Nasabah:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'kp.merauke@bankanp.com',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '🕒 Jam Operasional:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Senin – Jumat: 08.00 – 17.00 WIT',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Lokasi Kantor Pusat:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: GoogleMapsWidget()),
          const SizedBox(
            height: 30,
          ),
          const FooterResponsive()
        ],
      )),
    );
  }
}

class GoogleMapsWidget extends StatelessWidget {
  GoogleMapsWidget({super.key}) {
    // Daftarkan view factory hanya sekali
    ui.platformViewRegistry.registerViewFactory(
      'google-maps-iframe',
      (int viewId) {
        final IFrameElement element = IFrameElement()
          ..src =
              'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4951.242585617124!2d140.7076454758595!3d-2.537551297440823!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x686c5838219daaa9%3A0x629c84a1bdf6c9d6!2sPT.%20BPR%20Anak%20Negri%20Papua!5e1!3m2!1sid!2sid!4v1754294305625!5m2!1sid!2sid'
          ..style.border = '0'
          ..style.borderRadius = '12px'
          ..style.width = '100%'
          ..style.height = '400px'
          ..style.boxShadow = '0 0 12px rgba(0,0,0,0.1)'
          ..allowFullscreen = true;
        element.setAttribute('loading', 'lazy');
        return element;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: HtmlElementView(viewType: 'google-maps-iframe'),
    );
  }
}
