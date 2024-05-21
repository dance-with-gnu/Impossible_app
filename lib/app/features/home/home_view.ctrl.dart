import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/community/community_controller.dart';

class HomeViewController extends GetxController {
  int _tabIdx = 0;

  int get tabIdx => _tabIdx;
  bool show = true;

  late final PageController pgController;

  @override
  void onInit() {
    pgController = PageController();
    super.onInit();
  }

  void changeShowMenu() {
    show = false;
    update();
  }

  // change tab index
  void changeTabIndex(int idx) {
    if (idx > 3) return;
    _tabIdx = idx;
    pgController.jumpToPage(_tabIdx);

    if (_tabIdx != 0) {
      Get.find<CommunityController>().pauseAllVideos();
    } else {
      Get.find<CommunityController>().resumeCurrentVideo();
    }

    update();
  }
}
