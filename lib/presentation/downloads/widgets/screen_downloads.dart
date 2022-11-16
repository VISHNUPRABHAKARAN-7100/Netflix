import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List<String> imageList = [
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/AeyiuQUUs78bPkz18FY3AzNFF8b.jpg',
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rITxQBtnMpneZf8QzH1dqONQocx.jpg',
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rFljUdOozFEv6HDHIFpFvcYW0ec.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Downloads'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              kSizedBox(height: 0, width: 10),
              const Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              kSizedBox(height: 0, width: 10),
              const Text(
                'Smart Downloads',
              ),
            ],
          ),
          const Text('Introducing Downloads for you'),
          const Text(
            'We will download a personalised selection of movies and shows'
            ' for you, So there is always something to watch on your device',
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.4,
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[0],
                    margin: const EdgeInsets.only(left: 130, bottom: 50),
                    size: Size(size.width * 0.4, size.height * .58),
                    angle: 20,
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[1],
                    margin: const EdgeInsets.only(right: 130, bottom: 50),
                    angle: -20,
                    size: Size(size.width * 0.4, size.height * .58),
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[2],
                    margin: const EdgeInsets.only(left: 0, bottom: 10),
                    size: Size(size.width * 0.5, size.height * .68),
                    radius: 30,
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kButtonColorBlue,
            child: const Text(
              'Setup',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kButtonColourWhite,
            child: const Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
