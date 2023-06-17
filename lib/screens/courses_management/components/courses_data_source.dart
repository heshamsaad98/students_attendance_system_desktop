import 'package:flutter/material.dart';
import '../../../models/courses_model.dart';

class CoursesDataSource extends DataTableSource {
  CoursesDataSource(this.context) {
    rows = <CoursesModel>[
      CoursesModel(
        courseCode: '646589',
        courseName: 'Network',
        departmentName: 'Information System',
        instructorName: 'Dr/Mohamed Ali',
      ),
      CoursesModel(
        courseCode: '32656',
        courseName: 'Programming',
        departmentName: 'Information System',
        instructorName: 'Dr/Wafaa Hana',
      ),
      CoursesModel(
        courseCode: '80849',
        courseName: 'Systems Analysis',
        departmentName: 'Information System',
        instructorName: 'Dr/Amr Mahmoud',
      ),
      CoursesModel(
        courseCode: '30659',
        courseName: 'Money and Banks',
        departmentName: 'Arabic Accounting',
        instructorName: 'Dr/Mahmoud Amr',
      ),
      CoursesModel(
        courseCode: '32105',
        courseName: 'Data Security',
        departmentName: 'Computer Science',
        instructorName: 'Dr/Haitham Ahmed',
      ),
      CoursesModel(
        courseCode: '864546',
        courseName: 'Accounting',
        departmentName: 'English Administration',
        instructorName: 'Dr/Ali Mahmoud',
      ),
      CoursesModel(
        courseCode: '044564',
        courseName: 'Feasibility Study',
        departmentName: 'Information System',
        instructorName: 'Dr/Mariam Osama',
      ),
      CoursesModel(
        courseCode: '494592',
        courseName: 'Medical Systems',
        departmentName: 'Information System',
        instructorName: 'Dr/Adel Mohamed',
      ),
      CoursesModel(
        courseCode: '408465',
        courseName: 'Reports Preparation',
        departmentName: 'Information System',
        instructorName: 'Dr/Ibrahim Maged',
      ),
      CoursesModel(
        courseCode: '480484',
        courseName: 'Marketing',
        departmentName: 'Arabic Accounting',
        instructorName: 'Dr/Said Saleh',
      ),
      CoursesModel(
        courseCode: '184861',
        courseName: 'Database',
        departmentName: 'Computer Science',
        instructorName: 'Dr/Mohamed Amr',
      ),
      CoursesModel(
        courseCode: '404610',
        courseName: 'Operations Research',
        departmentName: 'Arabic Administration',
        instructorName: 'Dr/Amira Ibrahim',
      ),
    ];
  }

  final BuildContext context;
  late List<CoursesModel> rows;

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
        DataCell(Text(row.courseCode!)),
        DataCell(Text(row.courseName!)),
        DataCell(Text(row.departmentName!)),
        DataCell(Text(row.instructorName!)),
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
