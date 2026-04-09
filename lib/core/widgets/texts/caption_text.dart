import 'package:flutter/material.dart';
import 'package:photopulse/core/constant/app_sizing.dart';

import '../../styles/app_color.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double lineHeight;
  final bool isLineThrow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final String? fontFamily;

  const CaptionText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 1,
    this.fontFamily = 'Kavoon',
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.center,
    this.lineHeight = 0,
    this.isLineThrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.trim(),
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: fontSize ??AppSizing.captionTextFontSize,
        overflow: overflow,
        decoration: isLineThrow == false
            ? TextDecoration.none
            : TextDecoration.lineThrough,
        height: lineHeight,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
