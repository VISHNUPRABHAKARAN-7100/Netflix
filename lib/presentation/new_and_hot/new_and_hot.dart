import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import '../../core/constants/constants.dart';
import 'widget/coming_soon_widger.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
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
                width: 40,
                color: Colors.blue,
              ),
              kSizedBox(height: 0, width: 10),
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kBorderRadius(radius: 30),
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Eweryone\'s watching',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryOnesWatching(),
          ],
        ),
      ),
    );
  }

  _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ComingSoonWidget();
      },
    );
  }

  _buildEveryOnesWatching() {
    return ListView(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.amber,
        ),
      ],
    );
  }
}
