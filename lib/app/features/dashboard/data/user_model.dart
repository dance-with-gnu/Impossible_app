// models/user_model.dart

class UserModel {
  final String name;
  final int level;
  final int videoCount;
  final String profileImageUrl;
  final List<String> videoThumbnails;
  final List<String> videoPaths;

  UserModel({
    required this.videoPaths,
    required this.name,
    required this.level,
    required this.videoCount,
    required this.profileImageUrl,
    required this.videoThumbnails,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        level: json['level'],
        videoCount: json['videoCount'],
        profileImageUrl: json['profileImageUrl'],
        videoThumbnails: List<String>.from(json['videoThumbnails']),
        videoPaths: List<String>.from(json['videoPaths']));
  }
}
