// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../app_utils/app_extensions.dart';

class CustomSearch extends StatefulWidget {
   final bool align;
  final bool enable;
  final TextEditingController controller;
  final Color? color;
  final Function(String)? onSearchTextChanged;
  final Function(String)? onSubmit;
  VoidCallback? onTap;
  FocusNode? focus;
  double? width;
  double? higth;
  String? hint;
  VoidCallback? search;
  bool enabled;
  bool isSearch;

  CustomSearch(
      {Key? key,
      required this.controller,
      this.onTap,
      this.search,
      this.focus,
      this.hint,
      this.width = 88,
      this.higth = 2,
      this.enabled = true,
      this.isSearch = false,
      required this.onSearchTextChanged,
      this.color = Colors.white,
      this.onSubmit, required this.align, required this.enable})
      : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final ValueNotifier<TextDirection> _textDir = ValueNotifier(TextDirection.ltr);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.higth?.h,
      width: widget.width?.w,
      child: ValueListenableBuilder<TextDirection>(
        valueListenable: _textDir,
        builder: (context, value, child) => TextFormField(
          textDirection: widget.align ? TextDirection.rtl : value,
          enabled: widget.enable,
          onChanged: (input) {
            if (input.trim().length < 2) {
              final dir = getDirection(input);
              if (dir != value) _textDir.value = dir;
            }
            if (widget.onSearchTextChanged != null) {
              widget.onSearchTextChanged!(input);
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          style:  TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 4.sp,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          focusNode: widget.focus,
          controller: widget.controller,
          onChanged: widget.onSearchTextChanged,
          onSubmitted: widget.onSubmit,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            enabled: widget.enabled,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            hintText: ' App.tr.search',
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 9.sp,
            ),
            hintTextDirection: TextDirection.ltr,
            filled: true,
            fillColor: widget.color,
            suffixIconConstraints: BoxConstraints(minHeight: 4.h, minWidth: 4.h),
            // suffixIcon: Material(
            //   color: Colors.transparent,
            //   borderRadius: BorderRadius.circular(10.h),
            //   child: InkWell(
            //     borderRadius: BorderRadius.circular(10.h),
            //     onTap: widget.onTap,
            //     child: Container(
            //       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
            //       child: SvgPicture.asset(
            //         Resources.customize,
            //       ),
            //     ),
            //   ),
            // ),
            prefixIcon: IconButton(
              onPressed: widget.search,
              icon: Icon(
                Icons.search,
                size: 20.sp,
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.h),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.h),
            ),
          ),
        ),
      ),
    );
  }
    TextDirection getDirection(String v) {
    final string = v.trim();
    if (string.isEmpty) return TextDirection.ltr;
    final firstUnit = string.codeUnitAt(0);
    if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
        firstUnit > 0x0750 && firstUnit < 0x077F ||
        firstUnit > 0x07C0 && firstUnit < 0x07EA ||
        firstUnit > 0x0840 && firstUnit < 0x085B ||
        firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
        firstUnit > 0x08E3 && firstUnit < 0x08FF ||
        firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
        firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
        firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
        firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
        firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
        firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
        firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
        firstUnit > 0x10800 && firstUnit < 0x10805 ||
        firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
        firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
        firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
        firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
        firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
        firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
        firstUnit > 0x1D242 && firstUnit < 0x1D244) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }
}
