class StudentsModel {
  StudentsModel({
    required this.studentId,
    required this.studentName,
    required this.departmentName,
    required this.gender,
    required this.birthDate,
  });

  final String? studentName, departmentName, gender, birthDate;
  final int? studentId;
  bool selected = false;
}
