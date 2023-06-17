class LecturesModel {
  LecturesModel({
    required this.lectureId,
    required this.start,
    required this.end,
    required this.courseName,
    required this.semester,
    required this.departmentName,
    required this.instructorName,
  });

  final String? start,
      end,
      courseName,
      semester,
      departmentName,
      instructorName;
  final int? lectureId;
  bool selected = false;
}
