import 'package:flutter/material.dart';
import '../../../models/lectures_model.dart';

class LecturesDataSource extends DataTableSource {
  LecturesDataSource(this.context) {
    rows = <LecturesModel>[
      LecturesModel(
        lectureId: 1,
        start: '12:00',
        end: '03:00',
        semester: 'First term',
        courseName: 'Network',
        departmentName: 'Information System',
        instructorName: 'Dr/Mohamed Ali',
      ),
      LecturesModel(
        lectureId: 2,
        start: '01:00',
        end: '04:00',
        courseName: 'Programming',
        semester: 'First term',
        departmentName: 'Information System',
        instructorName: 'Dr/Wafaa Hana',
      ),
      LecturesModel(
        lectureId: 3,
        start: '09:00',
        end: '12:00',
        courseName: 'Systems Analysis',
        semester: 'Second term',
        departmentName: 'Information System',
        instructorName: 'Dr/Amr Mahmoud',
      ),
      LecturesModel(
        lectureId: 4,
        start: '03:00',
        end: '04:30',
        courseName: 'Money and Banks',
        semester: 'First term',
        departmentName: 'Arabic Accounting',
        instructorName: 'Dr/Mahmoud Amr',
      ),
      LecturesModel(
        lectureId: 5,
        start: '02:00',
        end: '04:00',
        courseName: 'Data Security',
        semester: 'Second term',
        departmentName: 'Computer Science',
        instructorName: 'Dr/Haitham Ahmed',
      ),
      LecturesModel(
        lectureId: 6,
        start: '09:00',
        end: '12:00',
        courseName: 'Accounting',
        semester: 'Second term',
        departmentName: 'English Administration',
        instructorName: 'Dr/Ali Mahmoud',
      ),
      LecturesModel(
        lectureId: 7,
        start: '11:00',
        end: '02:00',
        courseName: 'Feasibility Study',
        semester: 'Second term',
        departmentName: 'Information System',
        instructorName: 'Dr/Mariam Osama',
      ),
      LecturesModel(
        lectureId: 8,
        start: '12:00',
        end: '03:00',
        courseName: 'Medical Systems',
        semester: 'Second term',
        departmentName: 'Information System',
        instructorName: 'Dr/Adel Mohamed',
      ),
      LecturesModel(
        lectureId: 9,
        start: '01:30',
        end: '03:50',
        courseName: 'Reports Preparation',
        semester: 'First term',
        departmentName: 'Information System',
        instructorName: 'Dr/Ibrahim Maged',
      ),
      LecturesModel(
        lectureId: 10,
        start: '03:00',
        end: '04:30',
        courseName: 'Marketing',
        semester: 'First term',
        departmentName: 'Arabic Accounting',
        instructorName: 'Dr/Said Saleh',
      ),
      LecturesModel(
        lectureId: 11,
        start: '01:00',
        end: '03:00',
        courseName: 'Database',
        semester: 'Second term',
        departmentName: 'Computer Science',
        instructorName: 'Dr/Mohamed Amr',
      ),
      LecturesModel(
        lectureId: 12,
        start: '09:00',
        end: '11:30',
        courseName: 'Operations Research',
        semester: 'First term',
        departmentName: 'Arabic Administration',
        instructorName: 'Dr/Amira Ibrahim',
      ),
    ];
  }

  final BuildContext context;
  late List<LecturesModel> rows;

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
        DataCell(Text(row.lectureId.toString())),
        DataCell(Text(row.start!)),
        DataCell(Text(row.end!)),
        DataCell(Text(row.courseName!)),
        DataCell(Text(row.semester!)),
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
