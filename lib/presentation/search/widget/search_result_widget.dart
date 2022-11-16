import 'package:flutter/cupertino.dart';
import 'package:netflix_app/core/constants/constants.dart';
import 'package:netflix_app/presentation/search/widget/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/npBvD1rRQHYGrxuwr2OrzXLso1w.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBox(height: 5, width: 0),
        const SearchTextTitle(title: 'Movies & TV'),
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              20,
              (index) => const MyCard(),
            ),
          ),
        )
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: const DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
