import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/styles/app_color.dart';
import 'package:photopulse/core/widgets/texts/caption_text.dart';

class PageControllers extends StatelessWidget {
  final bool hasPreviousPage;
  final bool hasNextPage;
  final int currentPage;
  final Function() onPrevious;
  final Function() onNext;
  const PageControllers({
    super.key,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.currentPage,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: hasPreviousPage ? () => onPrevious() : null,
          child: CaptionText(
            text: 'Prev',
            color: hasPreviousPage ? AppColors.black : AppColors.greyColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.black.withAlpha(50),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: CaptionText(text: 'Page $currentPage'),
        ),
        TextButton(
          onPressed: hasNextPage ? () => onNext() : null,
          child: CaptionText(
            text: 'Next',
            color: hasNextPage ? AppColors.black : AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
