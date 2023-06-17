import 'package:flutter/material.dart';
import '../../../models/semesters_model.dart';

class SemestersDataSource extends DataTableSource {
  SemestersDataSource(this.context) {
    rows = <SemestersModel>[
      SemestersModel(
        semesterId: 1,
        semester: 'First term',
      ),
      SemestersModel(
        semesterId: 2,
        semester: 'Second term',
      ),
    ];
  }

  final BuildContext context;
  late List<SemestersModel> rows;

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
        DataCell(Text(row.semesterId.toString())),
        DataCell(Text(row.semester!)),
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
