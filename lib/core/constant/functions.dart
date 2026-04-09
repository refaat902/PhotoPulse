import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/styles/app_color.dart';

Future<void> showFullScreenLoader(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Center(
          child: Container(
            width: 120.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white
            ),
            alignment: Alignment.center,
            child: CircularProgressIndicator(color: AppColors.mainColor,),
          ),
        ),
      );
    },
  );
}
