import 'package:flutter/material.dart';

import 'package:tiktok/screens/home/widgets/feed_videos.dart';
import 'package:tiktok/screens/profile/profile_screen.dart';
import 'package:tiktok/widgets/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FeedVideos(),
    const Center(child: Text('Discover Screen')),
    const Center(child: Text('Messages Screen')),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Expanded(
            child: _screens[_currentIndex],
          ),
          BottomBar(
            indexScreen: _currentIndex,
            onTap: _onTabTapped,
          ),
        ],
      ),
    );
  }
}
