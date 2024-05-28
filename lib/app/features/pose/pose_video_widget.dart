import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PoseVideoWidget extends StatefulWidget {
  final String videoUrl;

  const PoseVideoWidget({super.key, required this.videoUrl});

  @override
  State<PoseVideoWidget> createState() => _PoseVideoWidgetState();
}

class _PoseVideoWidgetState extends State<PoseVideoWidget> {
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
    _controller.dispose();
    super.dispose();
  }

  void togglePlayPause() {
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
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: togglePlayPause,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : const CircularProgressIndicator();
  }
}
