import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 200,
              width: 40,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageUrl),
                ),
                color: Colors.amber,
                borderRadius: kBorderRadius(radius: 20),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          top: 80,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: kWhiteColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 120,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
