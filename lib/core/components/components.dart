import 'package:flutter/material.dart';

import '../app_utils/app_colors.dart';
import '../app_utils/app_fonts.dart';


//List<BottomNavigationBarItem> ?items;

List<BottomNavigationBarItem> navBarItems({
  IconData? icon1,
  String? labelData1,
  IconData? icon2,
  String? labelData2,
  IconData? icon3,
  String? labelData3,
  IconData? icon4,
  String? labelData4,
  IconData? icon5,
  String? labelData5,
  List<BottomNavigationBarItem>? items,
}) {
  return (
      items = [
    if (icon1 != null)
      BottomNavigationBarItem(
        icon: Icon(
          icon1,
        ),
        label: labelData1??"",
      ),
    if (icon2 != null)
      BottomNavigationBarItem(
        icon: Icon(
          icon2,
        ),
        label: labelData2??"",
      ),
    if (icon3 != null)
      BottomNavigationBarItem(
        icon: Icon(icon3),
        label: labelData3??"",
      ),
    if (icon4 != null)
      BottomNavigationBarItem(
        icon: Icon(icon4),
        label: labelData4??"",
      ),
    if (icon5 != null)
      BottomNavigationBarItem(
        icon: Icon(icon5),
        label: labelData5??"",
      ),
  ]);
}


Widget myDivider() => Container(
      width: double.infinity,
      color: Colors.grey[300],
      height: 1,
    ); //make a line seperate


