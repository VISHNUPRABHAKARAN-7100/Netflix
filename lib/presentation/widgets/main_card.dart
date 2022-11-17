import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 250,
        width: 130,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iqWCUwLcjkVgtpsDLs8xx8kscg6.jpg'),
          ),
          color: Colors.amber,
          borderRadius: kBorderRadius(radius: 20),
        ),
      ),
    );
  }
}
