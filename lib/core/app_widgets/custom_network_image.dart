import 'package:cached_network_image/cached_network_image.dart';
import '../app_utils/app_assets.dart';
import 'package:flutter/material.dart';
import '../app_utils/app_extensions.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return buildImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
    );
  }
}

ClipRRect buildImage(
    {required String imageUrl, required height, required width})
{
  return ClipRRect(
      borderRadius: BorderRadius.circular(1.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
        ),
        height: height,
        width: width,
        child: CachedNetworkImage(
          color: Colors.grey.shade300,
          imageBuilder: (context, imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(color: Colors.grey.shade200),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover
              ),
            ),
          ),
          imageUrl: imageUrl,
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: const Offset(2, 5), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(1.h),
              image: const DecorationImage(
                  image: AssetImage(AppImageAssets.defImg)),
            ),
            height: height,
            width: width,
          ),
          errorWidget: (context, url, error) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              image: const DecorationImage(
                image: AssetImage(AppImageAssets.defImg),
              ),
            ),
          ),
        ),
      ));
}
