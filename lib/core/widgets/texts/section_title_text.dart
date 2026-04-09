import 'package:flutter/material.dart';
import 'package:photopulse/core/constant/app_sizing.dart';

import '../../styles/app_color.dart';

class SectionTitleText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final int maxLines;
  final bool isUnderLine;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDirection? textDirection;

  const SectionTitleText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 1,
    this.fontFamily = 'Kavoon',
    this.textDirection,
    this.isUnderLine = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.center,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.trim(),
      textDirection: textDirection,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? AppSizing.sectionTextFontSize,
        decoration: isUnderLine == false
            ? TextDecoration.none
            : TextDecoration.underline,
        overflow: overflow,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
    );
  }
}
