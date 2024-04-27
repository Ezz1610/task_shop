import 'dart:ui' as ui;

import '../app_utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_text.dart';

class WidgetsHelper {
  //loading widget//
  static Widget loadingWidget({
     double? height,
    double? width,
    required double radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  //app bar//
  static AppBar customAppBar(BuildContext context, {required String title, VoidCallback? onTap}) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.w, 0, 0, 0),
        child: IconButton(
          onPressed: onTap ??
              () {
                FocusNode().unfocus();
              },
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
        ),
      ),
      title: CustomText(
        text: title,
        size: 15.sp,
        weight: FontWeight.bold,
      ),
    );
  }

//Bytes From Asset//
  static Future<Uint8List> getBytesFromAsset({required String image}) async {
    ByteData data = await rootBundle.load(image);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 70);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
