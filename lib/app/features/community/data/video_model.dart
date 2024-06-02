class VideoModel {
  final String path;
  final String username;
  final String musicname;
  int heart;
  final int poseId;
  final int poseCategoryId;
  bool isLiked;

  VideoModel(
      {required this.path,
      required this.username,
      required this.musicname,
      required this.heart,
      required this.poseId,
      required this.poseCategoryId,
      required this.isLiked});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      path: json['path'],
      username: json['username'],
      musicname: json['musicname'],
      heart: json['heart'],
      poseId: json['poseId'],
      poseCategoryId: json['poseCategoryId'],
      isLiked: json['isLiked'],
    );
  }
}
