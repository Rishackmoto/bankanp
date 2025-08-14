import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;
import 'package:flutter/material.dart';

class PdfIframeViewer extends StatelessWidget {
  final String pdfUrl;

  const PdfIframeViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    final viewID = 'pdf-viewer-${pdfUrl.hashCode}';

    // Registrasi iframe
    ui.platformViewRegistry.registerViewFactory(viewID, (int viewId) {
      final iframe = web.HTMLIFrameElement()
        ..src = pdfUrl
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%';
      return iframe;
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: HtmlElementView(viewType: viewID),
        );
      },
    );
  }
}
