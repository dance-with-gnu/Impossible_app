import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/community/community_controller.dart';
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

const TextStyle _popupText = TextStyle(
  color: Colors.black,
  fontSize: 13,
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
  final bool isLiked;
  final int index;
  final int heart;

  const VideoPlayerWidget(
      {super.key,
      required this.videoPlayerController,
      required this.username,
      required this.isInitialized,
      required this.musicName,
      required this.poseCategory,
      required this.poseId,
      required this.isLiked,
      required this.index,
      required this.heart});

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

  void _onMenuSelected(String value) {
    // 선택한 값을 처리하는 로직 추가
    print('Selected: $value');
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
                    padding: EdgeInsets.zero, // 패딩 설정
                    visualDensity: const VisualDensity(
                      vertical: -4,
                    ),
                    constraints: const BoxConstraints(), // constraints
                    icon: widget.isLiked
                        ? const Icon(Icons.favorite, color: Colors.white)
                        : const Icon(Icons.favorite_border,
                            color: Colors.white),

                    onPressed: () {
                      // 하트 버튼 클릭 시 동작 추가
                      if (widget.isLiked) {
                        Get.find<CommunityController>().unlikeVideo();
                      } else {
                        Get.find<CommunityController>().likeVideo();
                      }
                    },
                  ),
                  Text(
                    widget.heart.toString(),
                    style: _music,
                  ),
                  IconButton(
                    icon: Image.asset(
                      _getImgPath("righticon1.png"),
                      height: 30,
                    ),
                    onPressed: () {
                      Get.find<CommunityController>().pauseCurrentVideo();
                      Get.to(
                        transition: Transition.fade,
                        () => PoseImagePickerWidget(
                          poseCategory: widget.poseCategory,
                          poseId: widget.poseId,
                        ),
                      )!
                          .then((_) {
                        Get.find<CommunityController>().resumeCurrentVideo();
                      });
                    },
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onSelected: _onMenuSelected,
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: '최신',
                          child: Text('최신 순', style: _popupText),
                        ),
                        const PopupMenuItem<String>(
                          value: '좋아요',
                          child: Text('좋아요 순', style: _popupText),
                        ),
                        const PopupMenuItem<String>(
                          value: '조회수',
                          child: Text('조회수 순', style: _popupText),
                        ),
                      ];
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
