import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import '../../core/constants/constants.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget  {
  ScreenHome({super.key});

  ValueNotifier scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BackgroundCard(),
                    const MainTitleCard(title: 'Release in the past year'),
                    kSizedBox(height: 10),
                    const MainTitleCard(title: 'Tending Now'),
                    kSizedBox(height: 10),
                    const NumberTitleCard(),
                    kSizedBox(height: 10),
                    const MainTitleCard(title: 'Tense Dramas'),
                    kSizedBox(height: 10),
                    const MainTitleCard(title: 'South Indian Cinema'),
                  ],
                ),
                (scrollNotifier.value == true
                    ? AnimatedContainer(
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        duration: const Duration(milliseconds: 1400),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cast,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                kSizedBox(height: 0, width: 10),
                                Container(
                                  height: 20,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                                kSizedBox(width: 10)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:const [
                                Text(
                                  'Tv Shows',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kSizedBox(height: 10, width: 10)),
              ],
            ),
          );
        },
      ),
    );
  }
}
