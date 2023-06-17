class SemestersModel {
  SemestersModel({
    required this.semesterId,
    required this.semester,
  });

  final String? semester;
  final int? semesterId;
  bool selected = false;
}
