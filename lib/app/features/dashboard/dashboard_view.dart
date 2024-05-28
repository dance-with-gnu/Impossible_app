// views/user_view.dart

import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/dashboard/dashboard_controller.dart';
import 'package:impossible_flutter/app/features/dashboard/user_profile_widget.dart';
import 'package:impossible_flutter/app/features/home/home_view.ctrl.dart';

const TextStyle _text = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15,
  fontFamily: 'PretendardBold',
);

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add settings button functionality
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileInfoWidget(user: controller.user.value),
              const SizedBox(height: 16),
              UserProfileWidget(user: controller.user.value),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        hoverColor: IMColors.blue900,
        onPressed: () {
          // Add video creation functionality
          Get.find<HomeViewController>().changeTabIndex(1);
        },
        icon: const Icon(Icons.videocam, color: Colors.white),
        label: const Text('Make Video', style: _text),
        backgroundColor: IMColors.blue600,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
