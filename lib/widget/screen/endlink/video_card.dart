import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprise_endlink/model/video_model.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:enterprise_endlink/widget/screen/endlink/bloc/endlink_bloc.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/controls.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final CarouselController _carouselController = CarouselController();

  late VideoPlayerController _videoController;
  String previousVideoURL = '';
  bool _showControls = false;

  void _initializeVideoPlayer(int index) {
    final endlinkModel = context.read<EndlinkBloc>().state.endlinkModel;
    try {
      _videoController.dispose();
    } catch (_) {}
    final VideoMediaModel? currentVideo = endlinkModel.videos?[index];
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(currentVideo?.url ?? ""),
      closedCaptionFile: _loadCaptions(endlinkModel.videos?[index].captionsUrl ?? ""),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        final vtt = _loadCaptions(endlinkModel.videos?[index].captionsUrl ?? "");
        _videoController.setClosedCaptionFile(Future.value(vtt));
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

  Future<ClosedCaptionFile> _loadCaptions(String url) async {
    String vtt = "WEBVTT";
    if (url != "") {
      MediaService mediaService = GetIt.I.get();
      vtt = await mediaService.fetchVtt(url);
    }
    final vtgile = WebVTTCaptionFile(vtt);
    return vtgile;
  }

  _videoCheckEnded() async {
    final currentIndex = context.read<EndlinkBloc>().state.currentIndex;
    // if(!_videoController.value.isInitialized|| _videoController.value.duration == const Duration(milliseconds: 0)) return;
    final position = await _videoController.position ?? const Duration(seconds: 9999999);
    final videoEnded = (position == _videoController.value.duration);
    if (videoEnded && currentIndex == 0) {
      log('CHALLENGE: next page position: $position, duration: ${_videoController.value.duration} and videoEnded: $videoEnded');
      // _carouselController.nextPage();
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((EndlinkBloc bloc) => bloc);
    final endlinkModel = context.select((EndlinkBloc bloc) => bloc.state.endlinkModel);
    final loading = context.select((EndlinkBloc bloc) => bloc.state.loading);
    final currentIndex = context.select((EndlinkBloc bloc) => bloc.state.currentIndex);
    final VideoMediaModel? currentVideo = endlinkModel.videos?[currentIndex];

    log('CHALLENGE: build');
    if (currentVideo?.url != previousVideoURL && (endlinkModel.videos?.length ?? 0) > 0) {
      log('CHALLENGE: videos > 0');
      _initializeVideoPlayer(currentIndex);
      previousVideoURL = currentVideo?.url ?? '';
    }

    return GestureDetector(
        onTap: () {
          setState(() {
            _showControls = true;
            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                _showControls = false;
              });
            });
          });
        },
        child: CustomCard(
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
                !loading
                    ? CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              bloc.add(UpdateCurrentIndex(index: index));
                              // _initializeVideoPlayer(index);
                              setState(() {});
                            });
                          },
                          viewportFraction: 1,
                        ),
                        items: endlinkModel?.videos?.map((video) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  child: _videoController.value.isInitialized
                                      ? Stack(alignment: Alignment.center, children: [
                                          Positioned.fill(
                                              child: AspectRatio(
                                            aspectRatio: _videoController.value.aspectRatio,
                                            child: VideoPlayer(_videoController),
                                          )),
                                          if (_showControls)
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
                                            bottom: _showControls ? 30 : 10,
                                            child: ClosedCaption(
                                              text: _videoController.value.caption.text,
                                              textStyle: DefaultTextStyle.of(context).style.copyWith(fontSize: 14, color: Colors.white),
                                            ),
                                          ),
                                          if (_showControls)
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
                                          height: 250,
                                          color: Colors.grey.shade200,
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
                    : Container(
                        height: 250,
                        color: Colors.grey.shade200,
                        child: const Center(
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: Colors.blueAccent,
                                )))),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello there Mr. ${endlinkModel?.lastName}!",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      //greetings/ tilte
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "${endlinkModel.jobService} - Last update ${DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(endlinkModel?.lastUpdate ?? 0))}"),
                    ],
                  ),
                ),
              ],
            )));
  }
  Future<void> seek(Duration position) async {
    log("[video] seek $position");

    final d = _videoController.value.duration.inMilliseconds;
    final m = position.inMilliseconds.clamp(0, d);
    position = Duration(milliseconds: m);
    await _videoController.seekTo(position);
  }
}
