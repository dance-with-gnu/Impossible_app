import 'package:impossible_flutter/app/core/core.dart';

class PoseImageController extends GetxController {
  // final PoseRepository repository;

  PoseImageController();

  final RxInt waitTime = 0.obs;
  final RxInt poseIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    waitTime.value = 15;
  }

  @override
  void dispose() {
    waitTime.value = 15;
    poseIndex.value = 1;
    super.dispose();
  }

  void updateWaitTime(int time) {
    waitTime.value = time;
  }

  void updateIndex(int index) {
    poseIndex.value = index;
  }
}
