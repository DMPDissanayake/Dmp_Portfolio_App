import '../../domain/entities/experience_entity.dart'; // 💡 ඔයාගේ Entity Path එක දාන්න

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.role,
    required super.company,
    required super.duration,
    required super.isCurrent,
    required super.responsibilities,
    required super.technologies,
  });

  // 📥 Firestore එකෙන් එන දත්ත Object එකක් කිරීම
  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      role: map['role'] ?? '',
      company: map['company'] ?? '',
      duration: map['duration'] ?? '',
      isCurrent: map['is_current'] ?? false,
      responsibilities: map['responsibilities'] != null
          ? List<String>.from(map['responsibilities'])
          : [],
      technologies: map['technologies'] != null
          ? List<String>.from(map['technologies'])
          : [],
    );
  }

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel.fromMap(json);
  }

  Map<String, dynamic> toJson() => toMap();

  // 📤 ආපහු Firebase එකට දාන්න ඕන නම් Map එකක් කිරීම
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'company': company,
      'duration': duration,
      'is_current': isCurrent,
      'responsibilities': responsibilities,
      'technologies': technologies,
    };
  }
}
