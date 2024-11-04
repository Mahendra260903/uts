import 'package:video_player/video_player.dart';

class Video {
  final String id;
  final String videoTitle;
  final String url;
  final String comments;
  final String likes;
  final String songName;
  final String user;
  final String userPic;

  VideoPlayerController? controller;

  Video({
    required this.id,
    required this.videoTitle,
    required this.url,
    required this.comments,
    required this.likes,
    required this.songName,
    required this.user,
    required this.userPic,
    this.controller,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      videoTitle: json['video_title'],
      url: json['url'],
      comments: json['comments'],
      likes: json['likes'],
      songName: json['song_name'],
      user: json['user'],
      userPic: json['user_pic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video_title': videoTitle,
      'url': url,
      'comments': comments,
      'likes': likes,
      'song_name': songName,
      'user': user,
      'user_pic': userPic,
    };
  }

  Future<Null> loadController() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller?.initialize();
    controller?.setLooping(true);
  }
}
