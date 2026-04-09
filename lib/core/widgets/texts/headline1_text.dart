import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/app_sizing.dart';

import '../../styles/app_color.dart';

class HeadLine1Text extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final FontWeight? fontWeight;

  const HeadLine1Text({Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 1,
    this.fontFamily='Kavoon',
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = false,
    this.textAlign = TextAlign.start,
    this.fontWeight,
    this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpper! ? text.toUpperCase().trim() : text.trim(),
      style: TextStyle(
        letterSpacing: 0,
        color: color ?? AppColors.black,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: fontSize??AppSizing.headLine1TextFontSize,
        height: height ?? 1.h,
        overflow: overflow,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}