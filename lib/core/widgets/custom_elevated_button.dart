import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/app_sizing.dart';
import 'package:photopulse/core/styles/app_color.dart';
import 'package:photopulse/core/widgets/shimmer_widget.dart';
import 'package:photopulse/core/widgets/texts/body_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? textColor;
  final Color? borderColor;
  final void Function() onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? topLeftBorderRadius;
  final double? topRightBorderRadius;
  final double? bottomRightBorderRadius;
  final double? bottomLeftBorderRadius;
  final double? fontSize;
  final bool isUpper;
  final double? borderRadius;
  final bool isLoading;

  const CustomElevatedButton({
    Key? key,
    this.textColor,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.borderColor,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.topRightBorderRadius,
    this.topLeftBorderRadius,
    this.fontSize,
    required this.isLoading,
    this.isUpper = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? ShimmerWidget(
            width: double.infinity,
            height: 48.h,
            radius: borderRadius ?? AppSizing.elevatedBottomRaduis,
          )
        : InkWell(
            onTap: onPressed,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  borderRadius ?? AppSizing.elevatedBottomRaduis,
                ),
                gradient: AppColors.primaryColor,
              ),
              child: Center(
                child: BodyText(text: text, color: AppColors.white),
              ),
            ),
          );
  }
}
