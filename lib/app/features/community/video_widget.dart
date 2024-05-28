import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/pose/pose_image_picker_widget.dart';
import 'package:video_player/video_player.dart';

const TextStyle _name = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15,
  fontFamily: 'PretendardBold',
);

const TextStyle _music = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontFamily: 'PretendardMedium',
);

_getImgPath(String name) => 'assets/images/$name';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String username;
  final String musicName;
  final RxBool isInitialized;
  final int poseCategory;
  final int poseId;

  const VideoPlayerWidget(
      {super.key,
      required this.videoPlayerController,
      required this.username,
      required this.isInitialized,
      required this.musicName,
      required this.poseCategory,
      required this.poseId});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.videoPlayerController;
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 10, 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "@${widget.username}",
                    style: _name,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.music_note,
                          color: Colors.white, size: 13),
                      Text(
                        widget.musicName,
                        style: _music,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {
                      // 하트 버튼 클릭 시 동작 추가
                    },
                  ),
                  IconButton(
                    // icon: Icon(Icons.plus, color: Colors.white),
                    icon: Image.asset(
                      _getImgPath("righticon1.png"),
                      height: 30,
                    ),
                    onPressed: () {
                      // make 버튼 클릭
                      Get.to(
                        transition: Transition.fade,
                        () => PoseImagePickerWidget(
                          poseCategory: widget.poseCategory,
                          poseId: widget.poseId,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      // 설정 버튼 클릭 시 동작 추가
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
