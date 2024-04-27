// ignore_for_file: must_be_immutable

import 'package:task/core/app_utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? size;
  int? maxLines;
  FontWeight? weight;
  Color? color;
  TextDecoration? decoration;
  CustomText(
      {required this.text,
      this.color = Colors.black,
      this.weight,
      this.maxLines = 1,
      this.decoration = TextDecoration.none,
      this.size,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          // overflow: TextOverflow.visible,
          decoration: decoration,
          fontFamily: AppFonts.fontFamily,
          fontSize: size,
          fontWeight: weight,
          color: color),
    );
  }
}
