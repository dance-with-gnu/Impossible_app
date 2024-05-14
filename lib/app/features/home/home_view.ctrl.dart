import 'package:impossible_flutter/app/core/core.dart';

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
    if (idx > 4) return;
    _tabIdx = idx;
    pgController.jumpToPage(_tabIdx);

    update();
  }
}
