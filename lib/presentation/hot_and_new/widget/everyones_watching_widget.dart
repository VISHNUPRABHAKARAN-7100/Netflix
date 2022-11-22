import 'package:flutter/cupertino.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custome_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBox(
          height: 10,
        ),
         Text(
          movieName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
         Text(
          description,maxLines: 4,overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kGreyColor,
          ),
        ),
        kSizedBox(
          height: 50,
        ),
         VideoWidget(url: posterPath,),
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
