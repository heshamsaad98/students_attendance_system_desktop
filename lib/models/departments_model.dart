class DepartmentsModel {
  DepartmentsModel({
    required this.departmentId,
    required this.departmentName,
  });

  final String? departmentName;
  final int? departmentId;
  bool selected = false;
}
