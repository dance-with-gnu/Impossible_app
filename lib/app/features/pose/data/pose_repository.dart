import 'package:impossible_flutter/app/features/pose/data/pose_model.dart';

class PoseRepository {
  List<PoseModel> getBodyPoseList() {
    return [
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 0,
        poseName: "1",
        poseThumbnail: _getImgPath("thumbnail1.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
    ];
  }

  List<PoseModel> getHalfPoseList() {
    return [
      PoseModel(
        poseId: 0,
        poseCategoryId: 1,
        poseName: "2",
        poseThumbnail: _getImgPath("thumbnail4.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 1,
        poseName: "2",
        poseThumbnail: _getImgPath("thumbnail4.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 1,
        poseName: "2",
        poseThumbnail: _getImgPath("thumbnail4.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
      PoseModel(
        poseId: 0,
        poseCategoryId: 1,
        poseName: "2",
        poseThumbnail: _getImgPath("thumbnail4.jpeg"),
        poseDescription: "",
        poseVideoPath: _getVideoPath("han_cat.mp4"),
        poseViews: 0,
      ),
    ];
  }

  String _getImgPath(String name) => 'assets/images/$name';
  String _getVideoPath(String name) => 'assets/videos/$name';
}
