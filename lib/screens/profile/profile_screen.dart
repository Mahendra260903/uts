import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tiktok/utils/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person_add_alt_1_outlined),
                  Text(
                    "Tiktok",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://ui-avatars.com/api/?name=indo",
                          height: 100.0,
                          width: 100.0,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "@tiktok",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      const Column(
                        children: [
                          Text(
                            "930",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      const Column(
                        children: [
                          Text(
                            "14130",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 47,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 45,
                        height: 47,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.bookmark),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          await authService.deleteToken();
                        },
                        child: Container(
                          width: 45,
                          height: 47,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.logout),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.menu),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.black,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.black26,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              color: Colors.black26,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/otnqsqqzmsw7K/giphy.gif?cid=790b7611ls94czx42jg0z78rdszt246uzjkd23ewj56jbq5i&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/nk2C49mUNljb1scZgY/giphy.gif?cid=82a1493bmapmyiyfd7lnij7a0vqqb91lm9d4xascqfi5p7ge&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/MUHNdrm3vk7MoyUsCO/giphy.gif?cid=82a1493buz74d3vm0jw7h9e6k6hvlx702jwt6lya0pejtu3o&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/QxSSrQxSKaFECD7ywx/giphy.gif?cid=82a1493buz74d3vm0jw7h9e6k6hvlx702jwt6lya0pejtu3o&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/RKNNW4sy4SH0vCZ3ar/giphy.gif?cid=82a1493b2mk0dlqucdhi7iedljzsnos9niaru025r97ar3qo&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.white70,
                              width: .5,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/sXFwUsfF7dCEg/giphy.gif?cid=82a1493b6h5jksnej3fgff3oursuk1irjqgch9zp479oc7gx&ep=v1_gifs_trending&rid=giphy.gif&ct=g",
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
