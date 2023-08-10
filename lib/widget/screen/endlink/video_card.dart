import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:flutter/material.dart';
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

  final List<Map<String, dynamic>> videos = [
    {
      "url": "https://s3-us-west-2.amazonaws.com/tvin-dev/1686234825171856.mp4",
      "title": "Video #1",
      "notes": "",
      "thumbnail": "https://s3-us-west-2.amazonaws.com/truvideo-files-beta/image/1686234820019654.png",
      "captionsUrl": "https://tvin-dev.s3.amazonaws.com/1686234825171856.vtt",
      "date": 1686234844000,
      "ordinal": 1,
      "summary": null
    },
    {
      "url": "https://s3-us-west-2.amazonaws.com/tvin-dev/1686235022124760.mp4",
      "title": "Video #2",
      "notes": "",
      "thumbnail": "https://s3-us-west-2.amazonaws.com/truvideo-files-beta/image/1686235017056255.png",
      "captionsUrl": "https://tvin-dev.s3.amazonaws.com/1686235022124760.vtt",
      "date": 1686235045000,
      "ordinal": 2,
      "summary": null
    },
    {
      "url": "https://s3-us-west-2.amazonaws.com/tvin-dev/krisp_ab93286d-a6ea-46e6-abb9-5b893c6e0411.mp4",
      "title": "Video #3",
      "notes": "",
      "thumbnail": "https://s3-us-west-2.amazonaws.com/truvideo-files-beta/image/964d9ac8-3f95-4505-aa8f-712a51219833.png",
      "captionsUrl": null,
      "date": 1686240880000,
      "ordinal": 3,
      "summary": null
    }
  ];

  void _initializeVideoPlayer(int index) {
    try {
      _videoController?.dispose();
    } catch (_) {}
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videos[index]['url']))
      ..initialize().then((_) {
        setState(() {});
        final shouldPlay = videos[index]['ordinal'] == 1;
        if (shouldPlay) {
          _videoController.play();
        }
      });
  }

  @override
  void initState() {
    log('[CHALLENGE] initstate');

    _initializeVideoPlayer(_currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final MediaService mediaService = GetIt.I.get();
    // final videos = useMemoized(() async {
    //   final data = await mediaService.fetchMedia('41', 'asdf');
    //   return data;
    // }, []);
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
            CarouselSlider(
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
              items: videos.map((video) {
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
                              ])
                            : Container(
                                color: Colors.grey, child: const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator(color: Colors.blueAccent,)))));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello there MR Parlopiano Johhn",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                //greetings/ tilte
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("ROS12321 - Last update 3/10/2022"),
                //jobservice + last edit
                //greetings/ tilte
              ],
            ),
          ],
        ));
  }
}
