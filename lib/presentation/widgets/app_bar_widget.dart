import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
           Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
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
          kSizedBox(height: 0, width: 10),
        ],
      ),
    );
  }
}
