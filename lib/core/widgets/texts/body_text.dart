
import 'package:flutter/material.dart';
import 'package:photopulse/core/constant/app_sizing.dart';

import '../../styles/app_color.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  const BodyText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 1,
    this.fontFamily = 'Kavoon',
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = false,
    this.textAlign = TextAlign.start,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpper! ? text.toUpperCase().trim() : text.trim(),
      style: TextStyle(
        letterSpacing: 0,
        color: color ?? AppColors.darkGreyColor,
        fontWeight: FontWeight.w600,
        fontSize: fontSize ?? AppSizing.bodyTextFontSize,
        height: height ?? 1,
        overflow: overflow,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
