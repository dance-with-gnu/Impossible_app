// bindings/user_binding.dart

import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/dashboard/dashboard_controller.dart';
import 'package:impossible_flutter/app/features/dashboard/data/dashboard_repository.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
        () => DashboardController(DashboardRepository()));
  }
}
