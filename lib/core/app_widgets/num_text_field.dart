// ignore_for_file: must_be_immutable

import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/widget/keyboard/keyboard2.dart';

import '../app_utils/app_colors.dart';
import '../app_utils/app_extensions.dart';
import 'package:flutter/material.dart';

class NumberKeyboard extends StatefulWidget {
  NumberKeyboard({
    Key? key,
    required this.deviceNumberController,
    required this.userNumberController,
    required this.passwordNumberController,
    required this.isDeviceNumberLoginScreen,
    required this.isUserNumberLoginScreen,
    required this.isUserPasswordLoginScreen,
    this.pay = false,
  }) : super(key: key);
  TextEditingController? deviceNumberController;
  TextEditingController? userNumberController;
  TextEditingController? passwordNumberController;
  final bool isDeviceNumberLoginScreen;
  final bool isUserNumberLoginScreen;
  final bool isUserPasswordLoginScreen;
  bool pay;

  @override
  State<NumberKeyboard> createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  Widget _buildKey(String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .5.w),
      child: MaterialButton(
        onPressed: () {
          if (widget.isDeviceNumberLoginScreen) {
            if (value == 'x') {
              String currentDeviceText = widget.deviceNumberController!.text;

              if (currentDeviceText.isNotEmpty) {
                String elementToRemove = currentDeviceText.split('').last;
                int index = currentDeviceText.indexOf(elementToRemove);
                if (index != -1) {
                  String newText = currentDeviceText.replaceFirst(
                      elementToRemove, "", index);
                  widget.deviceNumberController!.text = newText;
                }
              }
            } else {
              final newString = "${widget.deviceNumberController!.text}$value";
              widget.deviceNumberController!.text = newString;
              widget.deviceNumberController!.selection =
                  TextSelection.fromPosition(
                TextPosition(offset: newString.length),
              );
            }
          }
          if (widget.isUserNumberLoginScreen) {
            if (value == 'x') {
              String currentDeviceText = widget.userNumberController!.text;

              if (currentDeviceText.isNotEmpty) {
                String elementToRemove = currentDeviceText.split('').last;
                int index = currentDeviceText.indexOf(elementToRemove);
                if (index != -1) {
                  // check if the element exists in the text
                  String newText = currentDeviceText.replaceFirst(
                      elementToRemove, "", index);
                  widget.userNumberController!.text = newText;
                }
              }
            } else {
              final newString = "${widget.userNumberController!.text}$value";
              widget.userNumberController!.text = newString;
              widget.userNumberController!.selection =
                  TextSelection.fromPosition(
                TextPosition(offset: newString.length),
              );
            }
          }
          if (widget.isUserPasswordLoginScreen) {
            if (value == 'x') {
              String currentDeviceText = widget.passwordNumberController!.text;
              if (currentDeviceText.isNotEmpty) {
                String elementToRemove = currentDeviceText.split('').last;
                int index = currentDeviceText.indexOf(elementToRemove);
                if (index != -1) {
                  // check if the element exists in the text
                  String newText = currentDeviceText.replaceFirst(
                      elementToRemove, "", index);
                  widget.passwordNumberController!.text = newText;
                }
              }
            } else {
              final newString =
                  "${widget.passwordNumberController!.text}$value";
              widget.passwordNumberController!.text = newString;
              widget.passwordNumberController!.selection =
                  TextSelection.fromPosition(
                TextPosition(offset: newString.length),
              );
            }
          }
        },
        child: Container(
          width: 8.2.w,
          height: 5.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kButtonRadius),
            color: whiteColor,
            // border: Border.all(color: warmGrey),
            boxShadow: [
              BoxShadow(
                  color: AppColors.mainColor,
                  blurRadius: 3,
                  spreadRadius: 0.02,
                  offset: const Offset(0.1, 0.1)),
            ],
          ),
          child: Center(
            child: Text(
              value,
              style: AppTextStyle.getBoldStyle(
                  color: Colors.black, fontSize: 6.sp),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 27.w,
        width: 33.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKey('1'),
                _buildKey('2'),
                _buildKey('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKey('4'),
                _buildKey('5'),
                _buildKey('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKey('7'),
                _buildKey('8'),
                _buildKey('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKey(widget.pay ? '.' : '-'),
                _buildKey('0'),
                _buildKey('x'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
