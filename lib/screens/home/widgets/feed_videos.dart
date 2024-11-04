import 'package:flutter/material.dart';

import 'package:tiktok/data/dummy_data.dart';
import 'package:tiktok/data/video.dart';
import 'package:tiktok/screens/home/widgets/video_card.dart';

class FeedVideos extends StatefulWidget {
  const FeedVideos({super.key});

  @override
  State<FeedVideos> createState() => _FeedVideosState();
}

class _FeedVideosState extends State<FeedVideos> {
  late List<Video> videos;
  int prevVideo = -1;
  int actualScreen = 0;

  @override
  void initState() {
    super.initState();
    videos = data.map((json) => Video.fromJson(json)).toList();
    loadVideo(0);
  }

  Future<void> loadVideo(int index) async {
    if (index < videos.length) {
      if (prevVideo != -1 && videos[prevVideo].controller != null) {
        await videos[prevVideo].controller?.pause();
      }

      final video = videos[index];
      if (video.controller == null) {
        await video.loadController();
      }

      setState(() {
        video.controller?.play();
      });

      prevVideo = index;
    }
  }

  void changeVideo(int index) {
    loadVideo(index);
  }

  @override
  void dispose() {
    for (var video in videos) {
      video.controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: videos.length,
          onPageChanged: (index) {
            changeVideo(index % videos.length);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = index % videos.length;
            return VideoCard(
              video: videos[index],
            );
          },
        ),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Following',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70),
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  color: Colors.white70,
                  height: 10,
                  width: 1.0,
                ),
                const SizedBox(
                  width: 7,
                ),
                const Text(
                  'For You',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
