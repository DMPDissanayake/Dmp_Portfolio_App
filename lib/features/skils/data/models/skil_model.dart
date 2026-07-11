import '../../domain/entities/skil_entity.dart'; // 💡 ඔයාගේ Entity එක තියෙන නිවැරදි Path එක දාන්න

class SkilModel extends SkilEntity {
  const SkilModel({
    required super.title,
    required super.category,
    super.iconPath,
    super.items,
    super.metrics,
    super.milestones,
    super.currentlyMastering,
    super.learningRoadmap,
  });

  // 📥 Firestore Map (JSON) එකක් SkilModel Object එකකට හැරවීම
  // 📥 Firestore Map (JSON) එකක් SkilModel Object එකකට හැරවීම
  factory SkilModel.fromMap(Map<String, dynamic> map) {
    // 1. metrics map එක ගන්නවා
    final metricsMap = map['metrics'] != null
        ? Map<String, dynamic>.from(map['metrics'])
        : null;

    // 2. currently_mastering map එක ගන්නවා
    final masterMap =
        map['currently_mastering'] != null || map['currentlyMastering'] != null
        ? Map<String, dynamic>.from(
            map['currently_mastering'] ?? map['currentlyMastering'],
          )
        : null;

    // 3. icon_code එක root එකේ තිබ්බොත් හරි currently_mastering ඇතුළේ තිබ්බොත් හරි ගන්නවා
    int? parsedIcon;
    if (map['icon_code'] != null) {
      parsedIcon = map['icon_code'] is int
          ? map['icon_code'] as int
          : int.tryParse(map['icon_code'].toString());
    } else if (masterMap != null && masterMap['icon_code'] != null) {
      parsedIcon = masterMap['icon_code'] is int
          ? masterMap['icon_code'] as int
          : int.tryParse(masterMap['icon_code'].toString());
    }

    // 4. milestones එක root එකේ නැත්නම් metrics ඇතුළෙන් හොයනවා (පරණ ඒවා සඳහා)
    dynamic milestonesData = map['milestones'];
    if (milestonesData == null && metricsMap != null) {
      milestonesData = metricsMap['milestones'];
    }

    // 5. learning_roadmap එක root එකේ නැත්නම් currently_mastering ඇතුළෙන් හොයනවා (පරණ ඒවා සඳහා)
    dynamic roadmapData = map['learning_roadmap'] ?? map['learningRoadmap'];
    if (roadmapData == null && masterMap != null) {
      roadmapData =
          masterMap['learning_roadmap'] ?? masterMap['learningRoadmap'];
    }

    return SkilModel(
      title: map['title'] ?? '',
      category: map['category'] ?? '',
      iconPath: parsedIcon, // නිවැරදිව parse කරගත් icon code එක
      // Technical / Professional Items List
      items: map['items'] != null ? List<String>.from(map['items']) : null,

      metrics: metricsMap,

      // Milestones mapping
      milestones: milestonesData != null
          ? (milestonesData as List)
                .map(
                  (item) => MilestoneItemModel.fromMap(
                    Map<String, dynamic>.from(item),
                  ),
                )
                .toList()
          : null,

      currentlyMastering: masterMap != null
          ? CurrentlyMasteringModel.fromMap(masterMap)
          : null,

      // Learning Roadmap mapping
      learningRoadmap: roadmapData != null
          ? (roadmapData as List)
                .map(
                  (item) => LearningRoadmapModel.fromMap(
                    Map<String, dynamic>.from(item),
                  ),
                )
                .toList()
          : null,
    );
  }

  factory SkilModel.fromJson(Map<String, dynamic> json) {
    return SkilModel.fromMap(json);
  }

  Map<String, dynamic> toJson() => toMap();

  // 📤 SkilModel Object එකක් Firestore එකට සේව් කරන්න පුළුවන් Map එකක් බවට හැරවීම
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'icon_code': iconPath,
      'items': items,
      'metrics': metrics,
      'milestones': milestones != null
          ? milestones!.map((e) => (e as MilestoneItemModel).toMap()).toList()
          : null,
      'currently_mastering': currentlyMastering != null
          ? (currentlyMastering as CurrentlyMasteringModel).toMap()
          : null,
      'learning_roadmap': learningRoadmap != null
          ? learningRoadmap!
                .map((e) => (e as LearningRoadmapModel).toMap())
                .toList()
          : null,
    };
  }
}

// ==========================================
// 💡 Sub-Models (Nested Objects සඳහා)
// ==========================================

// 1. Milestone Item Model (🔥 දැන් Firebase එකෙන් කෙලින්ම Array එන නිසා සරලයි)
class MilestoneItemModel extends MilestoneItemEntity {
  const MilestoneItemModel({required super.years, required super.description});

  factory MilestoneItemModel.fromMap(Map<String, dynamic> map) {
    List<String> parsedYears = [];

    if (map['years'] != null) {
      if (map['years'] is List) {
        // 💡 Firebase එකේ ["2023", "2024"] වගේ Array එකක් තියෙන නිසා කෙලින්ම ලෝඩ් වෙනවා
        parsedYears = List<String>.from(map['years']);
      } else if (map['years'] is String) {
        String yearsString = map['years'] as String;
        if (yearsString.isNotEmpty) {
          parsedYears = yearsString.split(',').map((e) => e.trim()).toList();
        }
      }
    }

    return MilestoneItemModel(
      years: parsedYears,
      // 💡 Firebase එකේ 'description' කියලා හැදුවා නම් ඒක ගන්නවා, නැත්නම් 'title' එක ගන්නවා
      description: map['description'] ?? map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'years': years, 'description': description};
  }
}

// 2. Currently Mastering Model
class CurrentlyMasteringModel extends CurrentlyMasteringEntity {
  const CurrentlyMasteringModel({
    required super.title,
    required super.subtitle,
  });

  factory CurrentlyMasteringModel.fromMap(Map<String, dynamic> map) {
    return CurrentlyMasteringModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'subtitle': subtitle};
  }
}

// 3. Learning Roadmap Model
class LearningRoadmapModel extends LearningRoadmapEntity {
  const LearningRoadmapModel({
    required super.title,
    required super.subtitle,
    required super.status,
    required super.progress,
    required super.iconType,
  });

  factory LearningRoadmapModel.fromMap(Map<String, dynamic> map) {
    double progressValue = 0.0;
    if (map['progress'] != null) {
      progressValue = (map['progress'] is int)
          ? (map['progress'] as int) / 100
          : (map['progress'] as num).toDouble();
    }

    return LearningRoadmapModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? map['description'] ?? '',
      status: map['status'] ?? 'Upcoming',
      progress: progressValue,
      iconType: map['iconType'] ?? map['icon_type'] ?? 'book',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'status': status,
      'progress': progress,
      'icon_type': iconType,
    };
  }
}
