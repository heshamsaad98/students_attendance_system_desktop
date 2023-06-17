import 'package:flutter/material.dart';
import '../../../models/instructors_model.dart';

class InstructorsDataSource extends DataTableSource {
  InstructorsDataSource(this.context) {
    rows = <InstructorsModel>[
      InstructorsModel(
        instructorId: 1,
        instructorName: 'Mohamed Ali',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '8/7/1988',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 2,
        instructorName: 'Wafaa Hana',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '9/5/1985',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 3,
        instructorName: 'Amr Mahmoud',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '22/9/1980',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 4,
        instructorName: 'Haitham Ahmed',
        departmentName: 'Computer Science',
        gender: 'Male',
        birthDate: '11/8/1990',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 5,
        instructorName: 'Ali Mahmoud',
        departmentName: 'English Administration',
        gender: 'Female',
        birthDate: '18/12/1986',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 6,
        instructorName: 'Mariam Osama',
        departmentName: 'Information System',
        gender: 'Female',
        birthDate: '15/5/1978',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 7,
        instructorName: 'Adel Mohamed',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '8/7/1988',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 8,
        instructorName: 'Said Saleh',
        departmentName: 'Arabic Accounting',
        gender: 'Male',
        birthDate: '10/11/1985',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 9,
        instructorName: 'Mohamed Amr',
        departmentName: 'Computer Science',
        gender: 'Male',
        birthDate: '16/4/1978',
        academicDegree: 'Doctor',
      ),
      InstructorsModel(
        instructorId: 10,
        instructorName: 'Amira Ibrahim',
        departmentName: 'Arabic Administration',
        gender: 'Female',
        birthDate: '23/1/1980',
        academicDegree: 'Doctor',
      ),
    ];
  }

  final BuildContext context;
  late List<InstructorsModel> rows;

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
        DataCell(Text(row.instructorId.toString())),
        DataCell(Text(row.instructorName!)),
        DataCell(Text(row.departmentName!)),
        DataCell(Text(row.gender!)),
        DataCell(Text(row.birthDate!)),
        DataCell(Text(row.academicDegree!)),
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
