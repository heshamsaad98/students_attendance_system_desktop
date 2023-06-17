import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:students_attendance_system_web/models/pdf_model.dart';
import 'package:students_attendance_system_web/screens/reports/components/reports_data.dart';

Future<Uint8List> makePdf() async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load(
    'assets/images/future_academy_logo.png',
  ))
      .buffer
      .asUint8List());

  Widget buildHeader() => Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image(imageLogo),
            ),
            SizedBox(height: 0.2 * PdfPageFormat.cm),
            Text(
              'Student attendance reports(by SAS)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget buildPdfReports() {
    final headers = [
      'Student id',
      'Student name',
      'Attendance days',
      'Absence days',
    ];

    final pdfStudentAttendanceData = PdfModel(
      pdfStudentAttendanceReports: reportsData,
    );

    final data =
        pdfStudentAttendanceData.pdfStudentAttendanceReports.map((item) {
      return [
        item.studentId,
        item.studentName,
        item.attendanceDays,
        item.absenceDays,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
      ),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.center,
        3: Alignment.center,
      },
    );
  }

  pdf.addPage(
    MultiPage(
      build: (context) => [
        buildHeader(),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        buildPdfReports(),
        Divider(),
      ],
    ),
  );

  return pdf.save();
}
