import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:proyecto_ui/models/curso_item.dart';

class VideoPlayerScreen extends StatefulWidget {
  final CursoItem item;
  VideoPlayerScreen({Key? key, required this.item}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

    @override
  void dispose() {
    // Dispose VideoPlayerController to release the resources
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network( widget.item.video_url,);
    await _videoPlayerController.initialize();
    _createChewieController();
    setState(() {});
  }

    void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(73, 69, 79, 1),
                        width: 1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(48, 48)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    alignment: AlignmentDirectional.center,
                      child: Text(
                        widget.item.name,
                        textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(29, 25, 43, 1),
                              fontFamily: 'Inter',
                              fontSize: 24,
                              letterSpacing: -1,
                              fontWeight: FontWeight.bold,
                              height: 1.3125),
                      ),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: _chewieController != null &&
                          _chewieController!
                              .videoPlayerController.value.isInitialized
                      ? Chewie(
                          controller: _chewieController!,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading...'),
                          ],
                        ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  widget.item.desc,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      letterSpacing: -1,
                      fontWeight: FontWeight.normal,
                      height: 1.3125),
                ),
              ),
            ),
          ],
          ),
        )
      )
    );
  }
}
