import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getSvgImage(String imageName) {
  return SvgPicture.asset(
    'assets/$imageName.svg',
    fit: BoxFit.scaleDown,
  );
}

Widget getPngImage(String imageName) {
  return Image.asset('assets/$imageName.png');
}
