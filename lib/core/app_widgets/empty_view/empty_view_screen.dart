// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../app_utils/app_extensions.dart';

import '../custom_button.dart';
import '../custom_text.dart';
import 'empty_item_model.dart';

class EmptyViewScreen extends StatelessWidget {
  final EmptyItemModel item;

  bool noH2;
  VoidCallback? onTap;
  String? txt;
  EmptyViewScreen(
      {Key? key, required this.item, this.onTap, this.txt, this.noH2 = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
// mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 4.h,
          width: double.infinity,
        ),
        CustomText(
          text: item.mainHeader ?? '',
          weight: FontWeight.w500,
          // color: MyColors.goldColor,
          size: 15.sp,
        ),
        SizedBox(
          height: 1.h,
          width: double.infinity,
        ),
        SizedBox(
          height: 37.h,
          width: double.infinity,
          child: Image.asset(
            item.image,
            height: 23.h,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 3.h,
          width: double.infinity,
        ),
        CustomText(
          text: item.mainTextHeader,
          weight: FontWeight.w500,
          // color: MyColors.boxHeaderColor,
          size: 14.sp,
        ),
        SizedBox(
          height: noH2 ? 1.5.h : 3.h,
        ),
        CustomText(
          text: item.h1,
          weight: FontWeight.w500,
          // color: MyColors.grayText,
          size: 10.sp,
        ),
        SizedBox(
          height: .5.h,
        ),
        CustomText(
          text: item.h2 ?? '',
          weight: FontWeight.w500,
          // color: MyColors.grayText,
          size: 10.sp,
        ),
        SizedBox(
          height: 3.h,
        ),
        CustomButton(
          onTap: onTap,
          fontSize: 14.sp,
          // buttonColor: MyColors.goldColor,
          titleColor: Colors.white,
          fontWeight: FontWeight.w400,
          title: txt ?? '',
          height: 6.h,
          width: 60.w,
        )
      ],
    );
  }
}
