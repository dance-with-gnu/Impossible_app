import 'dart:isolate';
import 'dart:ui';
import 'package:video_player/video_player.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/core.dart';

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
  // final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });

    // IsolateNameServer.registerPortWithName(
    //     _port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   setState(() {});
    // });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    // IsolateNameServer.removePortNameMapping('downloader_send_port');
    _controller.dispose();
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
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

  Future<void> _downloadFile(String url, String fileName) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // final directory = Platform.isAndroid
      //     ? await getExternalStorageDirectory()
      //     : await getApplicationDocumentsDirectory();
      final directory = (await getApplicationDocumentsDirectory()).path;

      final taskId = await FlutterDownloader.enqueue(
        url:
            "https://postfiles.pstatic.net/MjAyNDA1MTZfMTQ2/MDAxNzE1ODYzNTYzMzUz.s2jTdftPQfFFGe2lSJn0qXJ2e2RcEX5q7LZ3mXAFykgg.O5WFZ80H02KgPL3hKC5wIKfnpkBzYETPRM5pfsRFSLgg.PNG/%EC%A0%9C%EB%AA%A9%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-019.png?type=w966",
        savedDir: directory,
        fileName: fileName,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );

      Fluttertoast.showToast(msg: 'Download started: $taskId');
      print("파일 다운로드 완료");
    } else {
      Fluttertoast.showToast(msg: 'Permission Denied');
    }
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
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(13, 0, 10, 100),
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
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 70),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.download,
                                    color: Colors.white),
                                onPressed: () {
                                  _downloadFile(
                                      widget.videoUrl, 'downloaded_video.png');
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _showModal(context);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

void _showModal(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent, // 모달 뒤의 색
    context: context,
    builder: (context) {
      return Container(
        width: 330,
        height: 140,
        margin: const EdgeInsets.only(
            bottom: 50, left: 30, right: 30), // 모달 밑의 띄어짐 정도
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: IMColors.beige200,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // _modalBar(context), // 모달 상단의 바
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    IconButton_widget(
                      path: "assets/images/share_icons/instagram.png",
                      name: "Instagram",
                    ),
                    IconButton_widget(
                      path: "assets/images/share_icons/youtube.png",
                      name: "YouTube",
                    ),
                    IconButton_widget(
                      path: "assets/images/share_icons/copy.png",
                      name: "Copy Link",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class IconButton_widget extends StatelessWidget {
  final String path;
  final String name;

  const IconButton_widget({
    super.key,
    required this.path,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              path,
              height: 50,
            ),
            onPressed: () {},
          ),
          Text(
            name,
            style: const TextStyle(
              color: IMColors.blue1000,
              fontSize: 10,
              fontFamily: 'PretendardMedium',
            ),
          ),
        ],
      ),
    );
  }
}
