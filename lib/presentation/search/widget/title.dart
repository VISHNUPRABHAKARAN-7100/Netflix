import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
