import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprise_endlink/model/endlink_model.dart';
import 'package:enterprise_endlink/model/video_model.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/controls.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final CarouselController _carouselController = CarouselController();

  late VideoPlayerController _videoController;
  int _currentIndex = 0;
  EndlinkModel? endlinkModel;

  void _initializeVideoPlayer(int index) {
    try {
      _videoController?.dispose();
    } catch (_) {}
    final VideoMediaModel? currentVideo = endlinkModel?.videos?[index];
    log('[CHALLENGE] value: ${currentVideo?.url ?? ""}');
    _videoController = VideoPlayerController.networkUrl(Uri.parse(currentVideo?.url ?? ""))
      ..initialize().then((_) {
        final shouldPlay = currentVideo?.ordinal == 0;
        if (shouldPlay) {
          _videoController.play();
        }
        setState(() {});
      });
    _videoController.addListener(() {
      _videoCheckEnded();
    });
  }

  _videoCheckEnded() async {
    final position = await _videoController.position ?? const Duration(seconds: 0);
    final videoEnded = (position  == _videoController.value.duration);
    if(videoEnded && _currentIndex == 0) {
      _carouselController.nextPage();
    }
    setState(() {});
  }

  @override
  initState() {
    log('[CHALLENGE] initstate');
    MediaService mediaService = GetIt.I.get();
    mediaService.fetchEndlink("BDrA7de3").then((value) => setState(() {
          endlinkModel = value;
          _initializeVideoPlayer(_currentIndex);
          log('[CHALLENGE] value: ${endlinkModel?.videos?[0].url}');
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        padding: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                width: 100,
                child: Image.asset('assets/logo-color.png'),
              ),
            ),
            endlinkModel != null
                ? CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                          _initializeVideoPlayer(index);
                        });
                      },
                      height: 250,
                      viewportFraction: 1,
                    ),
                    items: endlinkModel?.videos?.map((video) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              height: 250,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(color: Colors.amber),
                              child: _videoController.value.isInitialized
                                  ? Stack(children: [
                                      Positioned.fill(
                                          child: AspectRatio(
                                        aspectRatio: _videoController.value.aspectRatio,
                                        child: VideoPlayer(_videoController),
                                      )),
                                      Positioned.fill(
                                        child: IconButton(
                                          onPressed: () {
                                            if (_videoController.value.isPlaying) {
                                              _videoController.pause();
                                            } else {
                                              _videoController.play();
                                            }
                                            setState(() {});
                                          },
                                          icon: _videoController.value.isPlaying
                                              ? const Icon(
                                                  Icons.pause_circle,
                                                  color: Colors.white,
                                                  size: 35,
                                                )
                                              : const Icon(Icons.play_circle, color: Colors.white, size: 35),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: CustomVideoPlayerControls(
                                          margin: const EdgeInsets.all(16.0),
                                          playing: _videoController.value.isPlaying,
                                          position: _videoController.value.position.inMilliseconds,
                                          duration: _videoController.value.duration.inMilliseconds,
                                          seek: (pos) async {
                                            await seek(Duration(milliseconds: pos));
                                          },
                                          onPlayPressed: () {
                                            if (_videoController.value.isPlaying) {
                                              _videoController.pause();
                                            } else {
                                              _videoController.play();
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ])
                                  : Container(
                                      color: Colors.grey,
                                      child: const Center(
                                          child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: Colors.blueAccent,
                                              )))));
                        },
                      );
                    }).toList(),
                  )
                : const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello there!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                //greetings/ tilte
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "ROS12321 - Last update ${DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(endlinkModel?.lastUpdate ?? 0))}"),
                //jobservice + last edit
                //greetings/ tilte
              ],
            ),
          ],
        ));
  }

  Future<void> seek(Duration position) async {
    log("[video] seek $position");

    final d = _videoController.value.duration.inMilliseconds;
    final m = position.inMilliseconds.clamp(0, d);
    position = Duration(milliseconds: m);
    await _videoController.seekTo(position);
  }
}
