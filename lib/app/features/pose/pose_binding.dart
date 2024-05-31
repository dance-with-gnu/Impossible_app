import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/pose/data/pose_repository.dart';
import 'package:impossible_flutter/app/features/pose/pose_controller.dart';
import 'package:impossible_flutter/app/features/pose/pose_image_controller.dart';

class PoseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoseController>(
        () => PoseController(repository: PoseRepository()));
    Get.lazyPut<PoseImageController>(() => PoseImageController());
  }
}
