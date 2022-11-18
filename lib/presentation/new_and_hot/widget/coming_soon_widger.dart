import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

import '../../home/widgets/custome_button_widget.dart';

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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/A1bWhTFQKkhF1yhSKWosSyzn2Hp.jpg',
                      fit: BoxFit.cover,
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
              ),
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