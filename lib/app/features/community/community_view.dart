import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/community/community_controller.dart';
import 'package:impossible_flutter/app/features/community/video_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommunityController controller = Get.find<CommunityController>();

    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          itemCount: controller.videoList.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            controller.changeVideo(index);
          },
          itemBuilder: (context, index) {
            final video = controller.videoList[index];

            return Obx(() => controller.isInitialized.value
                ? VideoPlayerWidget(
                    username: video.username,
                    isInitialized: controller.isInitialized,
                    videoPlayerController:
                        controller.videoPlayerControllers[index]!,
                    musicName: video.musicname,
                    poseCategory: video.poseCategoryId,
                    poseId: video.poseId,
                    isLiked: controller.isLiked[index],
                    index: index,
                    heart: video.heart,
                  )
                : const Center(child: CircularProgressIndicator()));
          },
        ),
        // const Positioned(
        //   top: 50,
        //   left: 20,
        //   child: Text(
        //     'community',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}
