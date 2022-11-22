import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
            errorBuilder: (_, error, stackTrace) {
              return const Center(
                child: Icon(
                  CupertinoIcons.wifi,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Icon(
              CupertinoIcons.volume_off,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
