import 'package:dmpportfolioapp/features/education/domain/entities/education_entity.dart';

class EducationModel extends EducationEntity {
  const EducationModel({
    required super.title,
    required super.institution,
    required super.dateRange,
    required super.bulletPoints,
    required super.iconCode,
    super.highlightBoxText,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      title: json['title'] ?? '',
      institution: json['institution'] ?? '',
      dateRange: json['dateRange'] ?? '',
      bulletPoints: List<String>.from(json['bulletPoints'] ?? []),
      iconCode: json['icon_code'] ?? 57746,
      highlightBoxText: json['highlightBoxText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'institution': institution,
      'dateRange': dateRange,
      'bulletPoints': bulletPoints,
      'icon_code': iconCode,
      'highlightBoxText': highlightBoxText,
    };
  }
}
