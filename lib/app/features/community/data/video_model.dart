class VideoModel {
  final String path;
  final String username;
  final String musicname;

  VideoModel(
      {required this.path, required this.username, required this.musicname});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      path: json['path'],
      username: json['username'],
      musicname: json['musicname'],
    );
  }
}
