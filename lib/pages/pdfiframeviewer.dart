import 'package:flutter/material.dart';
import 'dart:ui_web' as ui; // pengganti dart:ui untuk web
import 'dart:html' as html;

class PdfPreviewPage extends StatelessWidget {
  final String pdfUrl;

  const PdfPreviewPage({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    String viewType = 'pdf-view';
    // daftar hanya sekali
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = pdfUrl
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      },
    );

    return SizedBox.expand(
      child: HtmlElementView(viewType: viewType),
    );
  }
}
