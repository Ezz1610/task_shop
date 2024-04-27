import '../app_utils/app_colors.dart';
import '../app_utils/app_extensions.dart';
import '../app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

class CustomTextField extends StatefulWidget {
  final bool obscure;
  final bool align;
  final bool readOnly;
  final bool enable;
  final String? initialValue;
  final int? max;
  final int? min;
  final double? width;
  final double? hi;
  final Color color;
  final String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? controller;
  final IconData? suffix;
  final IconData? prefix;
  final TextInputType? type;
  final VoidCallback? visiblpass;
  final VoidCallback? hidsKeaboard;
  final VoidCallback? onedit;
  final double radius;
  final double fontSize;
  final TextAlign? textAlign;
  final VoidCallback? ontap;
  final FocusNode? focusNode;
  final TextInputAction? action;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {this.controller,
      this.align = true,
      this.readOnly = false,
      this.enable = true,
      this.action,
      this.inputFormatters,
      this.initialValue,
      this.focusNode,
      required this.hint,
      this.max = 1,
      this.min,
      this.obscure = false,
      this.onedit,
      this.suffix,
      this.type,
      required this.validator,
      this.visiblpass,
      Key? key,
      this.prefix,
      this.ontap,
      this.radius = 18,
      this.width,
      this.hi = 6.5,
      this.textAlign,
      this.color = Colors.transparent,
      this.hidsKeaboard,
      this.fontSize=14
      })
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      setState(() {
        _controller = widget.controller!;
      });
    }
    bool isR = isRTL(_controller.text);
    if (isR) {
      _textDir.value = TextDirection.rtl;
    } else {
      _textDir.value = TextDirection.ltr;
    }
  }

  final ValueNotifier<TextDirection> _textDir =
      ValueNotifier(TextDirection.ltr);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(widget.radius.h)),
          width: widget.width ?? size.width * .8,
          child: ValueListenableBuilder<TextDirection>(
              valueListenable: _textDir,
              builder: (context, value, child) {
                if (_controller.text.trim().length < 100) {
                  final dir = getDirection(_controller.text);
                  if (dir != value) _textDir.value = dir;
                }
                return TextFormField(

                  cursorWidth: .2.w,
                  readOnly: widget.readOnly,
                  cursorColor: AppColors.mainColor,
                  textDirection: _textDir.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: widget.inputFormatters,
                  enabled: widget.enable,
                  onTap: () {
                    if (_controller.selection ==
                        TextSelection.fromPosition(TextPosition(
                            offset: _controller.text.length - 1))) {
                      setState(() {
                        _controller.selection = TextSelection.fromPosition(
                            TextPosition(offset: _controller.text.length));
                      });
                    }
                    if (widget.hidsKeaboard != null) {
                      widget.hidsKeaboard!();
                    }
                  },
                  showCursor: true,
                  onChanged: (input) {
                    if (input.trim().length < 100) {
                      final dir = getDirection(input);
                      if (dir != value) _textDir.value = dir;
                    }
                    bool isR = isRTL(input);
                    if (isR) {
                      _textDir.value = TextDirection.rtl;
                    } else {
                      _textDir.value = TextDirection.ltr;
                    }
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                    if (widget.onedit != null) {
                      widget.onedit!();
                    }
                  },
                  onEditingComplete: widget.onedit,
                  textInputAction: widget.action,
                  maxLines: widget.max,
                  minLines: widget.min,
                  initialValue: widget.initialValue,
                  controller: _controller,
                  style: TextStyle(
                      fontSize: widget.fontSize,
                      fontFamily: AppTextStyle.mainArFont,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary),
                  keyboardType: widget.type,
                  obscureText: widget.obscure,
                  validator: widget.validator,
                  decoration: buildInputDecoration(color: widget.color),
                );
              }),
        ),
      ],
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

  InputDecoration buildInputDecoration({Color color = Colors.white}) {
    return InputDecoration(

        contentPadding: EdgeInsets.symmetric(vertical: 1.0.h), // errorText: '',
        fillColor: color,
        filled: true,
        alignLabelWithHint: false,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 5,
          minHeight: 5,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        suffixIcon: widget.suffix != null
            ? InkResponse(
                onTap: widget.visiblpass,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 3.w, end: 1.w),
                  child: Icon(
                    widget.suffix,
                    color: Colors.grey,
                  ),
                ),
              )
            : SizedBox(
                width: 5.w,
              ),
        labelText: widget.hint!,
        labelStyle: TextStyle(
          fontSize: 6.sp,
          fontFamily: AppTextStyle.mainArFont,
          fontWeight: FontWeight.w400,
          color: AppColors.hint,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(.5.h),
            borderSide: const BorderSide(color: Colors.grey)),
/*
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(.5.h),
            borderSide: const BorderSide(color: Colors.grey)),
*/
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(.5.h),
            borderSide: BorderSide(color: AppColors.primary, width: 2)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(.5.h),
          borderSide: const BorderSide(color: Colors.red),
        ));
  }
}
