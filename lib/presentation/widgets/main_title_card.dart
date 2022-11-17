import 'package:flutter/cupertino.dart';
import '../../core/constants/constants.dart';
import 'main.title.dart';
import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Release in the past year'),
        kSizedBox(height: 10, width: 0),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              20,
              (index) => const MainCard(),
            ),
          ),
        )
      ],
    );
  }
}
