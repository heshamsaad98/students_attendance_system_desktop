class InstructorsModel {
  InstructorsModel({
    required this.instructorId,
    required this.instructorName,
    required this.departmentName,
    required this.gender,
    required this.birthDate,
    required this.academicDegree,
  });

  final String? instructorName,
      departmentName,
      gender,
      birthDate,
      academicDegree;
  final int? instructorId;
  bool selected = false;
}
