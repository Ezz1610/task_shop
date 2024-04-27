// import 'package:fawttara/app.dart';
// import 'package:fawttara/core/app_utils/app_prefs.dart';
// import 'package:fawttara/core/app_utils/media_query_values.dart';
// import 'package:fawttara/core/app_widgets/app_sized_box.dart';
// import 'package:fawttara/core/dependency_injection/dependency_injection.dart';
// import 'package:flutter/cupertino.dart';
// import '../app_utils/app_colors.dart';
// import '../app_utils/app_extensions.dart';
// import 'num_text_field.dart';
// import 'package:flash/flash.dart';
// import 'package:flutter/material.dart';
//
// import 'custom_button.dart';
// import 'custom_text.dart';
// import 'package:collection/collection.dart';
//
// class AppDialogs {
//   //nota dialog//
//   static Future<void> buildAddNoteDialog(BuildContext context,
//       {required TextEditingController controller, required int index}) {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.zero,
//           contentPadding:
//               EdgeInsets.only(top: 2.h, left: 6.w, right: 6.w, bottom: 2.h),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(2.h))),
//           content: Builder(builder: (context) {
//             return SizedBox(
//                 height: 40.h,
//                 width: 80.w,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: CustomText(
//                         size: 8.sp,
//                         weight: FontWeight.w500,
//                         text: 'أضف ملاحظاتك',
//                       ),
//                     ),
//                     SizedBox(
//                       width: 90.w,
//                       child: TextField(
//                         controller: controller,
//                         maxLines: 3,
//                         minLines: 1,
//                         maxLength: 100,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 8.5.sp,
//                         ),
//                         decoration: InputDecoration(
//                           // contentPadding: EdgeInsets.symmetric(vertical: 1.h),
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           hintText: ' ملاحظاتك',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 8.5.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     const Spacer(
//                       flex: 1,
//                     ),
//                     CustomButton(
//                         radius: 1,
//                         height: 5.h,
//                         width: 80.w,
//                         titleColor: Colors.white,
//                         buttonColor: AppColors.mainColor,
//                         borderColor: AppColors.mainColor,
//                         title: 'إضافة',
//                         onTap: () {
//                           Navigator.of(context).pop();
//
//                         }),
//                   ],
//                 ));
//           }),
//           actionsPadding: EdgeInsets.only(bottom: 1.h),
//         );
//       },
//     );
//   }
//
//
//
//   static Future<Object?> buildCashInHand(
//     BuildContext context,
//   ) {
//     TextEditingController controller = TextEditingController();
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.only(left: 25.w, right: 25.w),
//           contentPadding:
//               EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w, bottom: 2.h),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(2.h))),
//           content: Builder(builder: (context) {
//             return SizedBox(
//                 height: 60.h,
//                 width: 70.w,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: CustomText(
//                             size: 8.sp,
//                             weight: FontWeight.w500,
//                             text: 'أدخل النقدية',
//                           ),
//                         ),
//                         const Spacer(),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: IconButton(
//                             icon: const Icon(Icons.close),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 90.w,
//                       child: TextField(
//                         readOnly: true,
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 8.5.sp,
//                         ),
//                         decoration: InputDecoration(
//                           // contentPadding: EdgeInsets.symmetric(vertical: 1.h),
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           hintText: '0.0',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 7.5.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                     NumberKeyboard(
//                       pay: true,
//                       deviceNumberController: controller,
//                       isDeviceNumberLoginScreen: true,
//                       isUserNumberLoginScreen: false,
//                       isUserPasswordLoginScreen: false,
//                       userNumberController: null,
//                       passwordNumberController: null,
//                     ),
//                     AppSizedBox.h3,
//                     CustomButton(
//                         radius: 1,
//                         height: 5.h,
//                         width: 80.w,
//                         titleColor: Colors.white,
//                         buttonColor: AppColors.mainColor,
//                         borderColor: AppColors.mainColor,
//                         title: 'إضافة',
//                         onTap: () async {
//                           Navigator.of(context).pop(controller.text);
//                         }),
//                     const Spacer(),
//                   ],
//                 ));
//           }),
//           actionsPadding: EdgeInsets.only(bottom: 1.h),
//         );
//       },
//     );
//   }
//
//   static errorDialog({
//     required String content,
//   }) {
//     return toastDialog(
//         title: App.tr.error, content: content, boxColor: Colors.red);
//   }
//
//   //toast dialog//
//   static Future<Object?> toastDialog({
//     context,
//     required String title,
//     required String content,
//     required Color boxColor,
//   }) {
//     // AppNavigator.navigateBack(context: context);
//     return showFlash(
//         context: appNavigatorKey.currentState!.context,
//         persistent: true,
//         transitionDuration: const Duration(milliseconds: 400),
//         duration: const Duration(seconds: 2),
//         builder: (context, controller) {
//           return Flash(
//               behavior: FlashBehavior.floating,
//               position: FlashPosition.bottom,
//               horizontalDismissDirection: HorizontalDismissDirection.horizontal,
//               boxShadows: kElevationToShadow[4],
//               margin: EdgeInsets.only(bottom: 5.h),
//               backgroundColor: boxColor,
//               borderRadius: BorderRadius.circular(2.h),
//               controller: controller,
//               onTap: () => controller.dismiss(),
//               child: Padding(
//                 padding: EdgeInsets.only(top: .5.h),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 30.w,
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(2.h),
//                               topRight: Radius.circular(2.h))),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: .2.h,
//                           ),
//                           Row(
//                             children: [
//                               CustomText(
//                                 text: title,
//                                 color: boxColor,
//                                 weight: FontWeight.w500,
//                                 size: 5.sp,
//                               ),
//                               const Spacer(
//                                 flex: 1,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   controller.dismiss();
//                                 },
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: .5.w, vertical: .5.h),
//                                   child: Icon(
//                                     Icons.clear,
//                                     color: Colors.grey.shade300,
//                                     size: 2.w,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.grey.shade100,
//                             thickness: 1.sp,
//                           ),
//                           CustomText(
//                             text: content,
//                             maxLines: 2,
//                             // color: MyColors.boxHeaderColor,
//                             size: 4.sp,
//                           ),
//                           SizedBox(
//                             height: .2.h,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
//
//   //alert dialog//
//   Future<Object?> customAlertDialog(
//       {required context,
//       required String content,
//       required VoidCallback onTap,
//       bool root = false}) {
//     return showFlash(
//         context: context,
//         transitionDuration: const Duration(milliseconds: 700),
//         persistent: true,
//         builder: (context, controller) {
//           return Flash.dialog(
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(bottom: 5.h),
//               // backgroundColor: MyColors.goldColor,
//               borderRadius: BorderRadius.circular(2.h),
//               controller: controller,
//               child: Padding(
//                 padding: EdgeInsets.only(top: 1.h),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 80.w,
//                       padding: EdgeInsets.symmetric(horizontal: 5.w),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(2.h),
//                               topRight: Radius.circular(2.h))),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             children: [
//                               CustomText(
//                                 text: 'App.tr.alert',
//                                 // color: MyColors.goldColor,
//                                 weight: FontWeight.w500,
//                                 size: 12.sp,
//                               ),
//                               const Spacer(
//                                 flex: 1,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   controller.dismiss();
//                                 },
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 1.w, vertical: 1.h),
//                                   child: Icon(
//                                     Icons.clear,
//                                     color: Colors.grey.shade300,
//                                     size: 4.w,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.grey.shade100,
//                             thickness: 1.sp,
//                           ),
//                           CustomText(
//                             text: content,
//                             // color: MyColors.boxHeaderColor,
//                             size: 11.sp,
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               CustomButton(
//                                 onTap: () {
//                                   onTap();
//                                   controller.dismiss();
//                                   if (root) {
//                                     Navigator.of(context, rootNavigator: true)
//                                         .pop();
//                                   }
//                                 },
//                                 // ontap: ,
//                                 fontSize: 11.sp,
//                                 title: 'App.tr.confirm',
//                                 height: 5.h,
//                                 fontWeight: FontWeight.w400,
//                                 width: 28.w,
//                                 // txtcolor: MyColors.white,
//                                 // butcolor: MyColors.goldColor,
//                                 // borderColor: MyColors.goldColor,
//                               ),
//                               CustomButton(
//                                 onTap: () {
//                                   controller.dismiss();
//                                 },
//                                 fontSize: 11.sp,
//                                 title: 'App.tr.cancel',
//                                 height: 5.h,
//                                 fontWeight: FontWeight.w400,
//                                 width: 28.w,
//                                 // txtcolor: MyColors.white,
//                                 // butcolor: MyColors.primarColor,
//                                 // borderColor: MyColors.primarColor,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
//
// // bottom sheet//
//   static Future<Object?> customBottomSheet(
//     context,
//     Widget screen, {
//     bool rootNavigator = true,
//     double initial = 0.6,
//   }) {
//     return showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context,
//         isScrollControlled: true,
//         useRootNavigator: rootNavigator,
//         clipBehavior: Clip.none,
//         isDismissible: true,
//         builder: (BuildContext context) {
//           return screen;
//         });
//   }
//
//   //animated dialog//
//   static Future<Object?> animationDialog(BuildContext context, Widget screen) {
//     return showGeneralDialog(
//       context: context,
//       barrierLabel: "withdraw",
//       barrierDismissible: false,
//       useRootNavigator: true,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 100),
//       pageBuilder: (context, a1, a2) {
//         return screen;
//       },
//       transitionBuilder: (context, anim1, anim2, child) {
//         return SlideTransition(
//           position:
//               Tween(begin: const Offset(0, 1), end: Offset.zero).animate(anim1),
//           child: child,
//         );
//       },
//     );
//   }
//
//   //snake bar //
//   static showSnakeBar(String message) {
//     BuildContext context = appNavigatorKey.currentState!.context;
//     final snackBar = SnackBar(
//       backgroundColor: AppColors.mainColor,
//       content: Center(
//           child: Text(
//             message,
//             style: TextStyle(color: Colors.white, fontSize: 6.sp),
//           )),
//     );
//
//     ScaffoldMessenger.of(context)
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
// static  void showDateSheet(
//       BuildContext context, {
//         required Widget child,
//         required VoidCallback onClicked,
//       }) =>
//       showCupertinoModalPopup(
//         context: context,
//         builder: (context) => CupertinoActionSheet(
//           actions: [
//             child,
//           ],
//           cancelButton: CupertinoActionSheetAction(
//             child: const Text('Done'),
//             onPressed: onClicked,
//           ),
//         ),
//       );
// }
