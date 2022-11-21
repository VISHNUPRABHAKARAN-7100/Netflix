
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custome_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBox(
          height: 10,
        ),
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          '''This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.''',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kSizedBox(
          height: 50,
        ),
        const VideoWidget(),
        kSizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CustomButtonWidget(
              customIcon: CupertinoIcons.location,
              iconText: 'Share',
              textSize: 14,
              iconsize: 17,
            ),
            kSizedBox(width: 10),
            const CustomButtonWidget(
              customIcon: CupertinoIcons.add,
              iconText: 'My List',
              textSize: 14,
              iconsize: 17,
            ),
            kSizedBox(width: 10),
            const CustomButtonWidget(
              customIcon: CupertinoIcons.play_arrow_solid,
              iconText: 'Pay',
              textSize: 14,
              iconsize: 17,
            ),
            kSizedBox(width: 10),
          ],
        )
      ],
    );
  }
}
