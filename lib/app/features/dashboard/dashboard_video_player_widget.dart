// widgets/video_player_screen.dart

import 'package:impossible_flutter/app/core/core.dart';
import 'package:video_player/video_player.dart';

const TextStyle _music = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontFamily: 'PretendardMedium',
);

class DashboardVideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String heroTag;

  const DashboardVideoPlayerScreen(
      {super.key, required this.videoUrl, required this.heroTag});

  @override
  _DashboardVideoPlayerScreenState createState() =>
      _DashboardVideoPlayerScreenState();
}

class _DashboardVideoPlayerScreenState
    extends State<DashboardVideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: widget.heroTag,
          child: _controller.value.isInitialized
              ? GestureDetector(
                  onTap: _togglePlayPause,
                  child: Stack(children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(13, 0, 10, 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.music_note,
                                    color: Colors.white, size: 13),
                                Text(
                                  "한강츄",
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
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // IconButton(
                            //   icon: const Icon(Icons.favorite,
                            //       color: Colors.white),
                            //   onPressed: () {
                            //     // 하트 버튼 클릭 시 동작 추가
                            //   },
                            // ),
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // make 버튼 클릭
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _showModal(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

void _showModal(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent, //	모달 뒤의 색
    context: context,
    builder: (context) {
      return Container(
        width: 330,
        height: 165,
        margin: const EdgeInsets.only(
            bottom: 50, left: 30, right: 30), //	모달 밑의 띄어짐 정도
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: IMColors.beige200,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // _modalBar(context),	//	모달 상단의 바
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        //... 카카오톡, 메시지, 링크복사 등등
                        );
                  }),
            )),
          ],
        ),
      );
    },
  );
}
