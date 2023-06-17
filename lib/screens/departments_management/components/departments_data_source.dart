import 'package:flutter/material.dart';
import '../../../models/departments_model.dart';

class DepartmentsDataSource extends DataTableSource {
  DepartmentsDataSource(this.context) {
    rows = <DepartmentsModel>[
      DepartmentsModel(
        departmentId: 1,
        departmentName: 'Information System',
      ),
      DepartmentsModel(
        departmentId: 2,
        departmentName: 'Computer Science',
      ),
      DepartmentsModel(
        departmentId: 3,
        departmentName: 'Arabic Accounting',
      ),
      DepartmentsModel(
        departmentId: 4,
        departmentName: 'English Accounting',
      ),
      DepartmentsModel(
        departmentId: 5,
        departmentName: 'Arabic Administration',
      ),
      DepartmentsModel(
        departmentId: 6,
        departmentName: 'English Administration',
      ),
    ];
  }

  final BuildContext context;
  late List<DepartmentsModel> rows;

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
        DataCell(Text(row.departmentId.toString())),
        DataCell(Text(row.departmentName!)),
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
