import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/pose/data/pose_repository.dart';

String _getImgPath(String name) => 'assets/images/$name';
String _getVideoPath(String name) => 'assets/videos/$name';

class PoseController extends GetxController {
  final PoseRepository repository;

  PoseController({required this.repository});

  var allVideoThumbnails = [
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
    _getImgPath("thumbnail3.jpeg"),
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
    _getImgPath("thumbnail3.jpeg"),
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
  ];
  var allVideoLists = [
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
  ];
  var bodyVideoThumbnails = [
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
    _getImgPath("thumbnail3.jpeg"),
  ];
  var bodyVideoLists = [
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
  ];
  var halfBodyVideoThumbnails = [
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
    _getImgPath("thumbnail3.jpeg"),
    _getImgPath("thumbnail1.jpeg"),
    _getImgPath("thumbnail2.jpeg"),
  ];
  var halfBodyVideoLists = [
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
    _getVideoPath("han_cat.mp4"),
  ];
}
