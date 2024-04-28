import 'package:flutter/material.dart';

import '../app_utils/app_colors.dart';
import '../app_utils/app_fonts.dart';


//List<BottomNavigationBarItem> ?items;

List<BottomNavigationBarItem> navBarItems({
  Image? icon1,
  String? labelData1,
  Image? icon2,
  String? labelData2,
  Image? icon3,
  String? labelData3,
  Image? icon4,
  String? labelData4,
  Image? icon5,
  String? labelData5,
  List<BottomNavigationBarItem>? items,
}) {
  return (
      items = [
    if (icon1 != null)
      BottomNavigationBarItem(
        icon:icon1,
        label: labelData1??"",
      ),
    if (icon2 != null)
      BottomNavigationBarItem(
        icon: icon2,
        label: labelData2??"",
      ),
    if (icon3 != null)
      BottomNavigationBarItem(
        icon: icon3,
        label: labelData3??"",
      ),
    if (icon4 != null)
      BottomNavigationBarItem(
        icon: icon4,
        label: labelData4??"",
      ),
    if (icon5 != null)
      BottomNavigationBarItem(
        icon: icon5,
        label: labelData5??"",
      ),
  ]);
}


Widget myDivider() => Container(
      width: double.infinity,
      color: Colors.grey[300],
      height: 1,
    ); //make a line seperate


