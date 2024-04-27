import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_extensions.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_widgets/custom_button.dart';
import 'package:task/core/widget/keyboard/keyboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:get/get_state_manager/get_state_manager.dart';

Future<Object?> showKeyboardDialog({
  required String title,
  required Function(String value) onSelect,
  String? value,
  String? footer,
}) async {
  return showDialog(
    context: appNavigatorKey.currentState!.context,
    // barrierColor: dialogBarrierColor,
    builder: (context) => KeyboardDialogBody(
      title: title,
      onSelect: onSelect,
      value: value,
      footer: footer,
    ),
  );
}

class KeyboardDialogBody extends StatelessWidget {
  String title;
  String? value;
  String? footer;

  final Function(String value) onSelect;

  KeyboardDialogBody({
    Key? key,
    required this.title,
    this.value,
    this.footer,
    required this.onSelect,
  }) : super(key: key);
  double kButtonRadius = 1.w;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kButtonRadius)),
      child: Container(
        color: Colors.transparent,
        width: 40.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SharedDialogTitle(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.getBoldStyle(
                          color: Colors.white, fontSize: 6.sp),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Keyboard(
                      value: value,
                      color: primaryColor,
                      style: AppTextStyle.hintSmallTextStyle,
                      onSelect: (value){
                        Navigator.of(context).pop(value);
                        onSelect(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatefulWidget {
  final Color? color;
  String? value;
  String? footer;

  final TextStyle? style;
  final Function(String value) onSelect;
  Keyboard({
    Key? key,
    this.color = primaryColor,
    this.style,
    this.value,
    this.footer,
    required this.onSelect,
  }) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  late final TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KeyboardController>(
      init: KeyboardController(),
      builder: (KeyboardController keyboardController) => Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.w, bottom: 2.w),
              child: Text(
                textEditingController.text,
                style: AppTextStyle.hintSmallTextStyle,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 50.w,
              height: 55.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
                child: GridView.count(
                    childAspectRatio: 1.7,
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List<Widget>.generate(12, (int index) {
                      return Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                            enableFeedback: true,
                            excludeFromSemantics: true,
                            splashColor: primaryColor,
                            // highlightColor: primaryColor,
                            borderRadius: BorderRadius.circular(kButtonRadius),
                            onTap: () => keyboardController.keyBoardHandler(
                                index, textEditingController),
                            child: Container(
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
                                  child: index == 10
                                      ? Text(
                                          '0',
                                          style: widget.style,
                                        )
                                      : index == 9
                                          ? Text(
                                              ".",
                                              style: widget.style,
                                            )
                                          : index == 11
                                              ? Text(
                                                  "C",
                                                  style: widget.style,
                                                )
                                              : Text(
                                                  (index + 1).toString(),
                                                  style: widget.style,
                                                )),
                            )),
                      );
                    })),
              ),
            ),
            SizedBox(height: 2.w),
            CustomButton(
              radius: 1,
              height: 5.h,
              width: 80.w,
              titleColor: Colors.white,
              buttonColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              onTap: () {
                widget.onSelect(textEditingController.text);
              },
              title: 'إضافة',
            ),
            SizedBox(height: 2.w),
            if (widget.footer != null) ...[
              SharedDialogFooter(
                footer: widget.footer!,
              ),
              SizedBox(height: 2.w),
            ]
          ],
        ),
      ),
    );
  }
}

class SharedDialogFooter extends StatelessWidget {
  const SharedDialogFooter({Key? key, required this.footer}) : super(key: key);
  final String footer;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 5.w,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPaddingValue,
        ),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kButtonRadius),
            topRight: Radius.circular(kButtonRadius),
          ),
        ),
        child: Text(
          footer,
          style: AppTextStyle.getBoldStyle(
            color: AppColors.mainColor,
            fontSize: 6.sp,
          ),
        ));
  }
}

class SharedDialogTitle extends StatelessWidget {
  const SharedDialogTitle({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.w,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPaddingValue,
      ),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        border: Border.all(color: AppColors.mainColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kButtonRadius),
          topRight: Radius.circular(kButtonRadius),
        ),
      ),
      child: child,
    );
  }
}

const double kAppBorderRadius = 5;
const double kButtonRadius = 10;
const double kHorizontalPaddingValue = 22;

const Color primaryColor = Color(0xff3576e7);
Color primary4Color = const Color(0xffF7FAFE);
Color primary7Color = const Color(0xff3576e7).withOpacity(0.07);
const Color primary12Color = Color.fromRGBO(53, 218, 231, 0.12);
Color primary10Color = const Color.fromRGBO(53, 118, 231, 0.1);
Color primary20Color = const Color.fromRGBO(53, 118, 231, 0.2);
Color primary15Color = const Color(0xff3576e7).withOpacity(0.15);
const Color borderColor = Color(0xFFdde4f5);
Color primary43Color = const Color(0xff3576e7).withOpacity(0.43);

const Color blackColor = Color(0xFF202020);
const Color blackTwoColor = Color(0xFF202020);
const Color blackThreeColor = Color(0xFF000000);
const Color black15 = Color.fromRGBO(0, 0, 0, 0.15);

const Color darkpinkishGreyColor = Color(0xFF262627);
const Color darkGreyTwoColor = Color(0xFF191a1b);
const Color warmGrey = Color(0xFFa1a1a1);
const Color whiteColor = Color(0xFFffffff);
const Color white2Color = Color(0xFFe9e9e9);
const Color scaffoldBackground = Color(0xFFf4f5f9);
Color dialogBarrierColor = Colors.black.withOpacity(0.2);
const Color dangerColor = Color(0xFFc95050);
const Color darkSalmon10_7Color = Color(0xFFc95050);
Color darkSalmon10Color = const Color(0xFFc95050).withOpacity(0.1);
Color darkSalmon15Color = const Color(0xFFc95050).withOpacity(0.15);
const Color darkSalmon10_14Color = Color(0xFFc95050);

const Color palepinkishGreyColor = Color(0xFFf4f5f9);
const Color pinkishpinkishGreyColor = Color(0xFFcdcdcd);

const Color brownishGrey = Color(0xFF6a6a6a);
const Color brownishGrey2 = Color(0xFF9c9c9c);
///////////// green /////////////
const Color greenColor = Color(0xFF2B6D3A);
const Color green2Color = Color(0xFF28cd0e);
const Color lightGreenColor = Color(0xFFE9F3EC);

///
const Color textFieldBorderColor = Color(0xFFc6ccd7);

///
/// Text Style
///
const TextStyle titleTextStyle = TextStyle(fontSize: 16, color: blackColor);
const TextStyle titleTextStyle17Black =
    TextStyle(fontSize: 17, color: blackColor);
const TextStyle titleTextStyle17DangerColor =
    TextStyle(fontSize: 17, color: dangerColor);
const TextStyle titleTextStyle17Primary =
    TextStyle(fontSize: 17, color: primaryColor);
const TextStyle titleTextStyle17BoldPrimary =
    TextStyle(fontSize: 17, color: primaryColor, fontWeight: FontWeight.bold);
const TextStyle titleTextStyle17BoldBlack =
    TextStyle(fontSize: 17, color: blackColor, fontWeight: FontWeight.bold);
const TextStyle titleTextStyle17Grey =
    TextStyle(fontSize: 17, color: brownishGrey);
const TextStyle titleTextStyle17White =
    TextStyle(fontSize: 17, color: whiteColor);
const TextStyle titleTextStyle17Danger =
    TextStyle(fontSize: 17, color: dangerColor);
const TextStyle titleTextStyle15Black =
    TextStyle(fontSize: 15, color: blackColor);
const TextStyle titleTextStyle15Grey =
    TextStyle(fontSize: 15, color: brownishGrey);
const TextStyle titleTextStyle15WarmGrey =
    TextStyle(fontSize: 15, color: warmGrey);
const TextStyle titleTextStyle15green2 =
    TextStyle(fontSize: 15, color: green2Color);
const TextStyle titleTextStyle27BoldBlack =
    TextStyle(fontSize: 27, color: blackColor, fontWeight: FontWeight.w700);
const TextStyle hintTextStyle =
    TextStyle(fontSize: 16, color: pinkishpinkishGreyColor);
const TextStyle titleTextStyle19Black =
    TextStyle(fontSize: 19, color: blackColor);
const TextStyle titleTextStyle25Black =
    TextStyle(fontSize: 25, color: blackColor);

const TextStyle titleTextStyle22White =
    TextStyle(fontSize: 22, color: whiteColor);
const TextStyle titleTextStyle20BoldWhite =
    TextStyle(fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold);
const TextStyle titleTextStyle20BoldBlack =
    TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.bold);
