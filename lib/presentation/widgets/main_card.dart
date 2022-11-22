import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 250,
        width: 130,
        decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                imageUrl),
          ),
         
          borderRadius: kBorderRadius(radius: 20),
        ),
      ),
    );
  }
}
