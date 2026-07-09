class EducationEntity {
  final String title;
  final String institution;
  final String dateRange;
  final List<String> bulletPoints;
  final int iconCode;
  final String? highlightBoxText;

  const EducationEntity({
    required this.title,
    required this.institution,
    required this.dateRange,
    required this.bulletPoints,
    required this.iconCode,
    this.highlightBoxText,
  });
}
