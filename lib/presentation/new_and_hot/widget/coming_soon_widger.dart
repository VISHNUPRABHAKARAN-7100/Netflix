import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

import '../../home/widgets/custome_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * .2,
          height: 450,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: size.width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tall Girl 2",
                    style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const CustomButtonWidget(
                    iconsize: 20,
                    textSize: 16,
                    customIcon: CupertinoIcons.bell,
                    iconText: 'Remind Me',
                  ),
                  kSizedBox(
                    width: 10,
                  ),
                  const CustomButtonWidget(
                    iconsize: 20,
                    textSize: 16,
                    customIcon: CupertinoIcons.info,
                    iconText: 'Info',
                  ),
                  kSizedBox(
                    width: 10,
                  ),
                ],
              ),
              const Text('Coming on Friday'),
              Row(
                children: [
                  Image.network(
                    'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                    width: 30,
                    height: 30,
                  ),
                  const Text(
                    'F I M L',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '''Landing in the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence --and her relationship -- into a tailspin.''',
                style: TextStyle(
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
