import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.customIcon,
    required this.iconText,
    this.textSize = 18,
    this.iconsize = 30,
  }) : super(key: key);

  final IconData customIcon;
  final String iconText;
  final double textSize;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          customIcon,
          size: iconsize,
          color: kWhiteColor,
        ),
        Text(
          iconText,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
