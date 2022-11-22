import 'package:flutter/cupertino.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';
import '../../home/widgets/custome_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * .15,
          height: 450,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 14,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: size.width * .85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
              Text('Coming on $day $month'),
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
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
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
