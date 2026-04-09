import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_color.dart';

class ErrorLoadingImageWidget extends StatelessWidget {
  const ErrorLoadingImageWidget({super.key,this.width = double.infinity,this.height = 86});

  final double? width ;
  final double? height ;

  @override
  Widget build(BuildContext context) {
    return  Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.textFormFieldBorderSide,
        ),
        height: height!.h,
        width: width,
        child: Icon(Icons.error_outline_outlined,size: 15,));
  }
}
