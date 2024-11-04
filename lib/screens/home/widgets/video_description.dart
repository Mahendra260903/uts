import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  final String username;
  final String videtoTitle;
  final String songInfo;

  const VideoDescription(this.username, this.videtoTitle, this.songInfo,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@$username',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              videtoTitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(children: [
              const Icon(
                Icons.music_note,
                size: 15.0,
                color: Colors.white,
              ),
              Text(
                songInfo,
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
