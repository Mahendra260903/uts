import 'package:flutter/material.dart';

import 'package:tiktok/utils/tiktok_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.indexScreen,
    required this.onTap,
  });

  final int indexScreen;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          menuButton('Home', TikTokIcons.home, 0),
          menuButton('Search', TikTokIcons.search, 1),
          SizedBox(
            width: 45.0,
            height: 27.0,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  width: 38,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 45, 108),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  width: 38,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 32, 211, 234),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Center(
                  child: Container(
                    height: double.infinity,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          menuButton('Messages', TikTokIcons.messages, 2),
          menuButton('Profile', TikTokIcons.profile, 3)
        ],
      ),
    );
  }

  Widget menuButton(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: indexScreen == index ? Colors.white : Colors.white70,
              size: 20,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight:
                    indexScreen == index ? FontWeight.bold : FontWeight.normal,
                color: indexScreen == index ? Colors.white : Colors.white70,
                fontSize: 11.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
