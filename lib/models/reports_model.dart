class ReportsModel {
  ReportsModel({
    required this.studentId,
    required this.studentName,
    required this.attendanceDays,
    required this.absenceDays,
  });

  final String? studentName, attendanceDays, absenceDays;
  final int? studentId;
  bool selected = false;
}
