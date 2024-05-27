// controllers/user_controller.dart

import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/dashboard/data/dashboard_repository.dart';
import 'package:impossible_flutter/app/features/dashboard/data/user_model.dart';

String _getImgPath(String name) => 'assets/images/$name';
String _getVideoPath(String name) => 'assets/videos/$name';

class DashboardController extends GetxController {
  final DashboardRepository dashboardRepository;
  var user = UserModel(
    name: '',
    level: 0,
    videoCount: 0,
    profileImageUrl: '',
    videoThumbnails: [],
    videoPaths: [],
    videoNames: [],
    heart: 0,
  ).obs;

  DashboardController(this.dashboardRepository);

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() {
    var videoThumbnails = [
      _getImgPath("thumbnail1.jpeg"),
      _getImgPath("thumbnail2.jpeg"),
      _getImgPath("thumbnail3.jpeg"),
      _getImgPath("thumbnail1.jpeg"),
      _getImgPath("thumbnail2.jpeg"),
      _getImgPath("thumbnail3.jpeg"),
      _getImgPath("thumbnail1.jpeg"),
      _getImgPath("thumbnail2.jpeg"),
      _getImgPath("thumbnail3.jpeg"),
      _getImgPath("thumbnail1.jpeg"),
      _getImgPath("thumbnail2.jpeg"),
      _getImgPath("thumbnail3.jpeg"),
    ];
    var videoPaths = [
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
      _getVideoPath("han_cat.mp4"),
    ];
    var videoNames = [
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
      "한강츄",
    ];
    var newUser = UserModel(
      name: 'soganglove',
      level: 5,
      profileImageUrl: _getImgPath("profile.jpeg"),
      videoThumbnails: videoThumbnails,
      videoCount: videoThumbnails.length,
      videoPaths: videoPaths,
      videoNames: videoNames,
      heart: 3,
    );

    user.value = newUser;
  }
}
