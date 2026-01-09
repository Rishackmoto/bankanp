import 'package:flutter/material.dart';
import 'dart:ui_web' as ui; // pengganti dart:ui untuk web
import 'dart:html' as html;
import 'dart:math';

class PdfPreviewPage extends StatelessWidget {
  final String pdfUrl;

  const PdfPreviewPage({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    // viewType unik setiap kali halaman dibuka
    final uniqueId = 'pdf-view-${Random().nextInt(100000)}';

    ui.platformViewRegistry.registerViewFactory(
      uniqueId,
      (int viewId) {
        final iframe = html.IFrameElement()
          // tambahkan anti-cache juga supaya browser ambil file baru
          ..src = '$pdfUrl?ts=${DateTime.now().millisecondsSinceEpoch}'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview PDF'),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox.expand(
        child: HtmlElementView(viewType: uniqueId),
      ),
    );
  }
}
