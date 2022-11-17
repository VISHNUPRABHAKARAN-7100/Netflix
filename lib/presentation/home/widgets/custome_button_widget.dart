
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.customIcon,
    required this.iconText,
  }) : super(key: key);

  final IconData customIcon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          customIcon,
          size: 30,
          color: kWhiteColor,
        ),
        Text(
          iconText,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}