class PoseModel {
  final int poseId;
  final int poseCategoryId;
  final String poseName;
  final String poseThumbnail;
  final String poseDescription;
  final String poseVideoPath;
  final int poseViews;

  PoseModel({
    required this.poseId,
    required this.poseCategoryId,
    required this.poseName,
    required this.poseThumbnail,
    required this.poseDescription,
    required this.poseVideoPath,
    required this.poseViews,
  });

  factory PoseModel.fromJson(Map<String, dynamic> json) {
    return PoseModel(
      poseId: json['id'],
      poseCategoryId: json['category_id'],
      poseName: json['name'],
      poseThumbnail: json['image'],
      poseDescription: json['description'],
      poseVideoPath: json['video'],
      poseViews: json['views'],
    );
  }
}
