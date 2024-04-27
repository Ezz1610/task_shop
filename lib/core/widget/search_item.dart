// ignore_for_file: must_be_immutable

import '../app_utils/app_extensions.dart';
import 'package:flutter/material.dart';

import '../app_utils/app_colors.dart';

class SearchItem extends StatelessWidget {
  var searchController = TextEditingController();

  SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1.5.h,
      ),
      child: searchItem(controller: searchController),
    );
  }

  Widget searchItem({
    required TextEditingController controller,
    TextDirection? textDirection,
    Function(String)? onFieldSubmit,
    Function(String)? onChange,
    bool isPassword = false,
    IconData? suffix,
    Function? suffixPressed,
    Function? onTap,
  }) =>
      Container(
        height: 6.3.h,
        width: 67.6.w,
        margin: EdgeInsets.only(right: 1.4.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.inputBorderColor, style: BorderStyle.solid),
            color: AppColors.white),
        child: TextFormField(
          textDirection: textDirection,
          controller: controller,
          keyboardType: TextInputType.text,
          onFieldSubmitted: onFieldSubmit,
          obscureText: isPassword,
          onChanged: onChange,

          /* inputFormatters: [

      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),

    ],*/

          decoration: InputDecoration(
            labelText: "...بحث ",
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: () {
                      suffixPressed!();
                    },
                    icon: Icon(suffix),
                  )
                : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Search Must Not Be Empty";
            }

            return null;
          },
          onTap: () {
            onTap;
          },
        ),
      );
}
