import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/community/community_view.dart';
import 'package:impossible_flutter/app/features/dashboard/dashboard_view.dart';
import 'package:impossible_flutter/app/features/home/home_view.ctrl.dart';
import 'package:impossible_flutter/app/features/home/nav_widget.dart';
import 'package:impossible_flutter/app/features/pose/pose_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static String get to => '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
        init: HomeViewController(),
        builder: (_) {
          return Scaffold(
              bottomNavigationBar: NavWidget(
                onChanged: _.changeTabIndex,
                selectedIdx: _.tabIdx,
              ),
              body: PageView(
                controller: _.pgController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const CommunityView(),
                  const PoseView(),
                  DashboardView(),
                ],
              ));
        });
  }
}
