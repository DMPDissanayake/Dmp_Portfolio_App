import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.name,
    required super.title,
    required super.profileUrl,
    required super.bio,
    required super.location,
    required super.cvUrl,
    required super.socialLinks,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      profileUrl: json['profile_url'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
      cvUrl: json['cv_url'] ?? '',
      // social_links map එක SocialLinksModel.fromJson එකට පාස් කරනවා
      socialLinks: json['social_links'] != null
          ? SocialLinksModel.fromJson(
              Map<String, dynamic>.from(json['social_links']),
            )
          : const SocialLinksModel(github: '', linkedIn: '', upwork: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'profile_url': profileUrl,
      'bio': bio,
      'location': location,
      'cv_url': cvUrl,
      'social_links': (socialLinks as SocialLinksModel).toJson(),
    };
  }
}

class SocialLinksModel extends SocialLinksEntity {
  const SocialLinksModel({
    required super.github,
    required super.linkedIn,
    required super.upwork,
  });

  // 📥 Map -> Object (fromJson)
  factory SocialLinksModel.fromJson(Map<String, dynamic> json) {
    return SocialLinksModel(
      github: json['github'] ?? '',
      linkedIn: json['linkedIn'] ?? json['linkedin'] ?? '',
      upwork: json['upwork'] ?? '',
    );
  }

  // 📤 Object -> Map (toJson)
  Map<String, dynamic> toJson() {
    return {'github': github, 'linkedIn': linkedIn, 'upwork': upwork};
  }
}
