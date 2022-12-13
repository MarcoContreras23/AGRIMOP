// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  createDocument() async {
    final pdf = pw.Document();
    //final image = pw.Image('assets/agriMOPLogo.png');

    // Page

    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          orientation: pw.PageOrientation.portrait,
        ),
        build: (context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.only(
              left: 60,
              right: 60,
              bottom: 30,
            ),
            child: pw.Column(
              children: [
                pw.Spacer(),
                pw.RichText(
                    text: pw.TextSpan(children: [
                  pw.TextSpan(
                    text: DateTime.now().year.toString() + '\n',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.grey600,
                      fontSize: 40,
                    ),
                  ),
                  pw.TextSpan(
                    text: 'Informe del cultivo',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ])),
                pw.Spacer(),
                pw.Container(
                  alignment: pw.Alignment.topRight,
                  height: 150,
                  child: pw.PdfLogo(),
                ),
                pw.Spacer(flex: 2),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.UrlLink(
                    destination: 'https://wikipedia.org/wiki/PDF',
                    child: pw.Text(
                      'https://wikipedia.org/wiki/PDF',
                      style: const pw.TextStyle(
                        color: PdfColors.pink100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset('assets/example.pdf'),
    );
  }
}
