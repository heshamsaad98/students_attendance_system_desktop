class CoursesModel {
  CoursesModel({
    required this.courseCode,
    required this.courseName,
    required this.departmentName,
    required this.instructorName,
  });

  final String? courseCode, courseName, departmentName, instructorName;
  bool selected = false;
}
