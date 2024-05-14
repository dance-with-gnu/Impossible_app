import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/landing/landing_controller.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LandingController());
  }
}
