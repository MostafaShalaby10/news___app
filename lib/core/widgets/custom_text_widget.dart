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
    required this.fontWeight, this.maxLines,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight fontWeight;final int? maxLines;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      text,
      maxLines:maxLines?? 2,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
