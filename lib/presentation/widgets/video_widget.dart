
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/A1bWhTFQKkhF1yhSKWosSyzn2Hp.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Icon(
              CupertinoIcons.volume_off,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}