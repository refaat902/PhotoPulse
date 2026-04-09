import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/app_sizing.dart';
import 'package:photopulse/core/styles/app_color.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double width;
  final Widget child;
  final Color? color;
  final Color? borderSideColor;
  final double? horPadding;
  final double? verPadding;
  final double? borderRadius;
  const CustomContainer({
    super.key,
    this.color,
    this.borderSideColor,
    this.height,
    required this.child,
    required this.width,
    this.horPadding,
    this.verPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horPadding ?? AppSizing.paddingWidth,
        vertical: verPadding ?? AppSizing.contantContainerPaddingHeight,
      ),
      width: width,
      height: height?.h,
      decoration: BoxDecoration(
        color: color ?? AppColors.textFormFieldBackGround,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizing.defualtRaduis.r,
        ),
        border: Border.all(
          color: borderSideColor ?? AppColors.textFormFieldBorderSide,
        ),
      ),
      child: child,
    );
  }
}
