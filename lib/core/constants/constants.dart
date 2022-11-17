import 'package:flutter/cupertino.dart';


/// Function for SizedBox
kSizedBox({required double height, required double width}) {
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
