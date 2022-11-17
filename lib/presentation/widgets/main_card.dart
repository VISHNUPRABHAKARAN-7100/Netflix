
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/7WfAuzUtztPJ9rDEzmjx0I4NIDw.jpg'),
        ),
        color: Colors.amber,
        borderRadius: kBorderRadius(radius: 20),
      ),
    );
  }
}