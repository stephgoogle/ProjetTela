import 'package:flutter/material.dart';
import 'package:mobile/models/pub_pack.dart';
import 'package:mobile/services/pdfexport.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final PackSouscription? souscription;
const PdfPreviewPage( this.souscription, {super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(souscription),
      ),
    );
  }
}