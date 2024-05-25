import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/pose/pose_controller.dart';
import 'package:impossible_flutter/app/features/pose/tab_widget.dart';

class PoseView extends StatelessWidget {
  const PoseView({super.key});

  @override
  Widget build(BuildContext context) {
    final poseController = Get.find<PoseController>();

    return Scaffold(
      body: IMTabView(length: 3, tabList: const [
        '전체',
        '전신',
        '반신'
      ], widgetList: [
        TabVideoWidget(
          videoList: poseController.allVideoLists,
          thumbnailList: poseController.allVideoThumbnails,
        ),
        TabVideoWidget(
          videoList: poseController.bodyVideoLists,
          thumbnailList: poseController.bodyVideoThumbnails,
        ),
        TabVideoWidget(
          videoList: poseController.halfBodyVideoLists,
          thumbnailList: poseController.halfBodyVideoThumbnails,
        ),
      ]),
    );
  }
}

class TabVideoWidget extends StatelessWidget {
  const TabVideoWidget(
      {super.key, required this.videoList, required this.thumbnailList});

  final List<String> videoList;
  final List<String> thumbnailList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/triangle_toggle_icon.png",
                height: 10,
              ),
            ),
            const Text("조회수 순",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'PretendardMedium',
                )),
          ],
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, // Maximum width of each grid item
            mainAxisSpacing: 10,
            crossAxisSpacing: 4,
            childAspectRatio: 0.75, // Aspect ratio to make height longer
          ),
          itemCount: videoList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showImageDialog(context, thumbnailList[index]);
              },
              child: Image.asset(
                thumbnailList[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }
}

void _showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          // width: MediaQuery.of(context).size.width * 0.9,
          // height: MediaQuery.of(context).size.height * 0.8,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}
