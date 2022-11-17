import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laugh/video_list_item/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(20, (index) {
            return VideListItem(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
