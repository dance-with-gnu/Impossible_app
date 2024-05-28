import 'package:get/get.dart';
import 'package:impossible_flutter/app/features/community/data/community_repository.dart';
import 'package:impossible_flutter/app/features/community/data/video_model.dart';
import 'package:video_player/video_player.dart';

_getVideoPath(String name) => 'assets/videos/$name';

class CommunityController extends GetxController {
  var videoList = <VideoModel>[].obs;
  var currentIndex = 0.obs;
  var lastIndex = 0;
  RxBool isInitialized = false.obs; // 초기화 상태를 나타내는 변수 추가
  final CommunityRepository repository;
  Map<int, VideoPlayerController> videoPlayerControllers = {};

  CommunityController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadVideoList();
    print("videoList: $videoList");

    initializeVideoPlayer(0);
    changeVideo(0);

    print("getVideoPlayer OK");
  }

  // void loadVideos() async {
  //   try {
  //     var videos = await repository.loadingVideos();
  //     videoList.assignAll(videos);
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  void loadVideoList() async {
    final videoPaths = [
      _getVideoPath("1.mp4"),
      _getVideoPath("2.mp4"),
      _getVideoPath("3.mp4"),
      _getVideoPath("4.mp4")
    ];
    videoList.assignAll(videoPaths
        .map((path) => VideoModel(
            path: path,
            username: 'soganglove',
            musicname: 'A Pimp named Slickback',
            poseId: 1,
            poseCategoryId: 1,
            heart: 3))
        .toList());
    if (videoList.isNotEmpty) {
      initializeVideoPlayer(currentIndex.value); // 현재 비디오 초기화
      if (currentIndex.value + 1 < videoList.length) {
        initializeVideoPlayer(currentIndex.value + 1); // 다음 비디오 초기화
      }
    }
  }

  void initializeVideoPlayer(int index) {
    final videoPath = videoList[index].path;
    if (!videoPlayerControllers.containsKey(index)) {
      print('Initializing VideoPlayerController with path: $videoPath');
      videoPlayerControllers[index] = VideoPlayerController.asset(videoPath)
        ..initialize().then((_) {
          videoPlayerControllers[index]!.setLooping(true);
          print('VideoPlayerController initialized for index $index');
          isInitialized.value = true;
          update();
        }).catchError((error) {
          print(
              'Error initializing VideoPlayerController for index $index: $error');
        });
    }
  }

  void pauseAllVideos() {
    videoPlayerControllers.forEach((key, controller) {
      if (controller.value.isPlaying) {
        controller.pause();
      }
    });
  }

  void resumeCurrentVideo() {
    videoPlayerControllers[currentIndex.value]!.play();
  }

  void disposeVideoPlayer(int index) {
    if (videoPlayerControllers.containsKey(index)) {
      videoPlayerControllers[index]!.dispose();
      videoPlayerControllers.remove(index);
    }
  }

  void changeVideo(int index) {
    videoPlayerControllers[lastIndex]?.pause();
    // pauseAllVideos(); // 모든 비디오 일시 정지
    currentIndex.value = index;
    initializeVideoPlayer(index); // 현재 비디오 초기화
    videoPlayerControllers[index]?.seekTo(Duration.zero);
    videoPlayerControllers[index]!.play();
    if (index + 1 < videoList.length) {
      initializeVideoPlayer(index + 1); // 다음 비디오 초기화
    }
    if (index - 1 >= 0) {
      initializeVideoPlayer(index - 1); // 이전 비디오 초기화
    }
    lastIndex = index;
  }

  @override
  void dispose() {
    videoPlayerControllers.forEach((key, controller) {
      controller.dispose();
    });
    videoPlayerControllers.clear();
    super.dispose();
  }
}
