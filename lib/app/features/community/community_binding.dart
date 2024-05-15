import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/community/community_controller.dart';
import 'package:impossible_flutter/app/features/community/data/community_repository.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityController>(
        () => CommunityController(repository: CommunityRepository()));
  }
}
