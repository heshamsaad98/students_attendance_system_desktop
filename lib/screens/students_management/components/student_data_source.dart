import 'package:flutter/material.dart';
import '../../../models/students_model.dart';

class StudentDataSource extends DataTableSource {
  StudentDataSource(this.context) {
    rows = <StudentsModel>[
      StudentsModel(
        studentId: 1,
        studentName: 'Hesham Saad',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '8/10/1998',
      ),
      StudentsModel(
        studentId: 2,
        studentName: 'Tariq Goma',
        departmentName: 'Arabic Accounting',
        gender: 'Male',
        birthDate: '10/5/2000',
      ),
      StudentsModel(
        studentId: 3,
        studentName: 'Mohamed Adel',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '11/12/1999',
      ),
      StudentsModel(
        studentId: 4,
        studentName: 'Amr Saad',
        departmentName: 'Computer Science',
        gender: 'Male',
        birthDate: '20/6/2001',
      ),
      StudentsModel(
        studentId: 5,
        studentName: 'Ahmed Omar',
        departmentName: 'Computer Science',
        gender: 'Male',
        birthDate: '8/9/1999',
      ),
      StudentsModel(
        studentId: 6,
        studentName: 'Fahd Ibrahim',
        departmentName: 'English Administration',
        gender: 'Male',
        birthDate: '9/11/1997',
      ),
      StudentsModel(
        studentId: 7,
        studentName: 'Ibrahim Ashraf',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '9/11/2002',
      ),
      StudentsModel(
        studentId: 8,
        studentName: 'Haitham Rabea',
        departmentName: 'English Accounting',
        gender: 'Male',
        birthDate: '17/10/1998',
      ),
      StudentsModel(
        studentId: 9,
        studentName: 'Fatma Ali',
        departmentName: 'Computer Science',
        gender: 'Female',
        birthDate: '7/3/2002',
      ),
      StudentsModel(
        studentId: 10,
        studentName: 'Mohamed Ahmed',
        departmentName: 'Arabic Administration',
        gender: 'Male',
        birthDate: '8/8/1996',
      ),
      StudentsModel(
        studentId: 11,
        studentName: 'Ala Mahmoud',
        departmentName: 'Information System',
        gender: 'Female',
        birthDate: '19/12/1999',
      ),
      StudentsModel(
        studentId: 12,
        studentName: 'Dina Amr',
        departmentName: 'Information System',
        gender: 'Female',
        birthDate: '22/1/2001',
      ),
      StudentsModel(
        studentId: 13,
        studentName: 'Hossam Mohamed',
        departmentName: 'Arabic Accounting',
        gender: 'Male',
        birthDate: '8/10/1997',
      ),
      StudentsModel(
        studentId: 14,
        studentName: 'Ali Mahmoud',
        departmentName: 'Computer Science',
        gender: 'Male',
        birthDate: '11/11/2000',
      ),
      StudentsModel(
        studentId: 15,
        studentName: 'Mahmoud Sami',
        departmentName: 'Information System',
        gender: 'Male',
        birthDate: '19/9/1999',
      ),
      StudentsModel(
        studentId: 16,
        studentName: 'Mona Ahmed',
        departmentName: 'Information System',
        gender: 'Female',
        birthDate: '6/8/2002',
      ),
      StudentsModel(
        studentId: 17,
        studentName: 'Hiba Mahmoud',
        departmentName: 'English Administration',
        gender: 'Female',
        birthDate: '19/7/2000',
      ),
    ];
  }

  final BuildContext context;
  late List<StudentsModel> rows;

  static int selectedCount = 0;

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
        DataCell(Text(row.departmentName!)),
        DataCell(Text(row.gender!)),
        DataCell(Text(row.birthDate!)),
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
