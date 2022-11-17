import 'package:flutter/cupertino.dart';

/// Function for SizedBox
kSizedBox({double height = 0, double width = 0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
// Function for BorderRadius

kBorderRadius({
  required double radius,
}) {
  return BorderRadius.circular(radius);
}

// Image

const mainImage =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/tgVBMIiJczfBWINRRd9yxE8ESln.jpg';
