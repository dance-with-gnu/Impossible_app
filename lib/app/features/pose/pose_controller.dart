import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/pose/data/pose_model.dart';
import 'package:impossible_flutter/app/features/pose/data/pose_repository.dart';

class PoseController extends GetxController {
  final PoseRepository repository;

  PoseController({required this.repository});

  var allPoseList = <PoseModel>[].obs; // Initialize as an observable list
  var poseList = List<PoseModel>.empty().obs;

  final List<PoseModel> bodyPoseList = <PoseModel>[].obs;
  final List<PoseModel> halfPoseList = <PoseModel>[].obs;
  final RxInt waitTime = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeAllPoseList();
  }

  void initializeAllPoseList() {
    bodyPoseList.assignAll(repository.getBodyPoseList());
    halfPoseList.assignAll(repository.getHalfPoseList());
    allPoseList = [...bodyPoseList, ...halfPoseList].obs;
  }

  void updateWaitTime(int time) {
    waitTime.value = time;
  }
}
