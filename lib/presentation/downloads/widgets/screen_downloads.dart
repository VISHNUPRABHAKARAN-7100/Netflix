import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Downloads'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => kSizedBox(height: 25, width: 0),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    return SafeArea(
      child: Column(
        children: [
          const Text(
            'Introducing Downloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kWhiteColor, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          kSizedBox(height: 10, width: 0),
          const Text(
            'We will download a personalised selection of\n movies and shows'
            ' for you, So there is always something to watch on your\n device',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          BlocBuilder<DownloadsBloc, DownloadsState>(
            builder: (context, state) {
              return SizedBox(
                width: size.width,
                height: size.width,
                child: Center(
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              radius: size.width * 0.3,
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[0].posterPath}',
                              margin: const EdgeInsets.only(left: 170, top: 40),
                              size: Size(size.width * 0.35, size.height * 0.25),
                              angle: 15,
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[1].posterPath}',
                              margin:
                                  const EdgeInsets.only(right: 170, top: 40),
                              angle: -15,
                              size: Size(size.width * 0.35, size.height * 0.25),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[2].posterPath}',
                              margin: const EdgeInsets.only(
                                  left: 0, bottom: 40, top: 50),
                              size: Size(size.width * 0.35, size.height * 0.25),
                              radius: 10,
                            ),
                          ],
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: kButtonColorBlue,
            shape: RoundedRectangleBorder(
              borderRadius: kBorderRadius(radius: 5),
            ),
            child: const Text(
              'Setup',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        kSizedBox(height: 10, width: 0),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius(radius: 5),
          ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
