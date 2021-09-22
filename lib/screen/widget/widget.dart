import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/image_constants.dart';

Widget dividerSpace({double width = 0, double height = 0}) {
  return SizedBox(width: width, height: height);
}

Widget widgetLogo() {
  return SvgPicture.asset(ICON_TWITTER,
      width: 72, height: 72, color: Colors.white);
}
