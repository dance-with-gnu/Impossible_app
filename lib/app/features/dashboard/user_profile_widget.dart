// widgets/user_profile_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/dashboard/dashboard_video_player_widget.dart';
import 'package:impossible_flutter/app/features/dashboard/data/user_model.dart';

const TextStyle _name = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontFamily: 'PretendardBold',
);

const TextStyle _text = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: 'PretendardRegular',
);

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150, // Maximum width of each grid item
        mainAxisSpacing: 10,
        crossAxisSpacing: 4,
        childAspectRatio: 0.75, // Aspect ratio to make height longer
      ),
      itemCount: user.videoThumbnails.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              transition: Transition.fade,
              () => DashboardVideoPlayerScreen(
                videoUrl: user.videoPaths[index],
                heroTag: 'videoThumb$index',
                // videoName: user.videoNames[index],
              ),
            );
          },
          child: Hero(
            tag: 'videoThumb$index',
            child: Image.asset(
              user.videoThumbnails[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              user.profileImageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: _name,
              ),
              const SizedBox(height: 5),
              Text(
                'Level ${user.level}',
                style: _text,
              ),
              Text(
                '${user.videoCount} videos',
                style: _text,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
