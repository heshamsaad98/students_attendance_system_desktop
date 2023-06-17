import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'components/make_pdf.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PDF Preview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }
}
