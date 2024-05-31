import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/pose/data/pose_model.dart';
import 'package:impossible_flutter/app/features/pose/pose_controller.dart';
import 'package:impossible_flutter/app/features/pose/pose_image_picker_widget.dart';
import 'package:impossible_flutter/app/features/pose/pose_video_widget.dart';
import 'package:impossible_flutter/app/features/pose/tab_widget.dart';

const TextStyle _button = TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontFamily: 'PretendardMedium',
);

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
          poseList: poseController.allPoseList,
        ),
        TabVideoWidget(
          poseList: poseController.bodyPoseList,
        ),
        TabVideoWidget(
          poseList: poseController.halfPoseList,
        ),
      ]),
    );
  }
}

class TabVideoWidget extends StatelessWidget {
  const TabVideoWidget({super.key, required this.poseList});

  final List<PoseModel> poseList;

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
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150, // Maximum width of each grid item
              mainAxisSpacing: 10,
              crossAxisSpacing: 4,
              childAspectRatio: 0.75, // Aspect ratio to make height longer
            ),
            itemCount: poseList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showVideoDialog(context, poseList[index].poseVideoPath,
                      poseList[index].poseCategoryId, poseList[index].poseId);
                },
                child: Image.asset(
                  poseList[index].poseThumbnail,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void _showVideoDialog(
    BuildContext context, String videoPath, int poseCategory, int poseId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Stack(
            children: [
              PoseVideoWidget(
                videoUrl: videoPath,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(IMColors.beige200)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.to(
                        transition: Transition.fade,
                        () => PoseImagePickerWidget(
                          poseCategory: poseCategory,
                          poseId: poseId,
                        ),
                      );
                    },
                    child: const Text(
                      "선택",
                      style: _button,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
