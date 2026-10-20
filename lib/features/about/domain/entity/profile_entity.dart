import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String title;
  final String profileUrl;
  final String bio;
  final String location;
  final String cvUrl;
  final SocialLinksEntity socialLinks; // 💡 List

  const ProfileEntity({
    required this.name,
    required this.title,
    required this.profileUrl,
    required this.bio,
    required this.location,
    required this.cvUrl,
    required this.socialLinks,
  });

  @override
  List<Object?> get props => [
    name,
    title,
    profileUrl,
    bio,
    location,
    cvUrl,
    socialLinks,
  ];
}

// 💡 Sub-Entity එකත් ලස්සනට Equatable කරලා වෙන් කරගත්තා
class SocialLinksEntity extends Equatable {
  final String github;
  final String linkedIn;
  final String upwork;

  const SocialLinksEntity({
    required this.github,
    required this.linkedIn,
    required this.upwork,
  });

  @override
  List<Object?> get props => [github, linkedIn, upwork];
}
