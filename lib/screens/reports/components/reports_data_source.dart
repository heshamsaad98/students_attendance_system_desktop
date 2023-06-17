import 'package:flutter/material.dart';
import 'package:students_attendance_system_web/screens/reports/components/reports_data.dart';
import '../../../models/reports_model.dart';

class ReportsDataSource extends DataTableSource {
  ReportsDataSource(this.context) {
    rows = reportsData;
  }

  final BuildContext context;
  late List<ReportsModel> rows;

  int selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= rows.length) return null!;
    final row = rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          selectedCount += value! ? 1 : -1;
          assert(selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.studentId.toString())),
        DataCell(Text(row.studentName!)),
        DataCell(Text(
          row.attendanceDays!,
          style: const TextStyle(color: Colors.green),
        )),
        DataCell(Text(
          row.absenceDays!,
          style: const TextStyle(color: Colors.red),
        )),
      ],
    );
  }

  @override
  int get rowCount => rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => selectedCount;
}
