import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.textColor = textPrimaryColor,
    this.textAlign,
    required this.fontWeight,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.start,
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
