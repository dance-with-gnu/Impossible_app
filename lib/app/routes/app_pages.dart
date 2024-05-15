import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/community/community_binding.dart';
import 'package:impossible_flutter/app/features/community/community_view.dart';
import 'package:impossible_flutter/app/features/home/home_view.dart';
import 'package:impossible_flutter/app/features/landing/landing_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      bindings: [
        LandingBinding(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.community,
      page: () => const CommunityView(),
      bindings: [
        CommunityBinding(),
      ],
      transition: Transition.fadeIn,
    ),
  ];
}
