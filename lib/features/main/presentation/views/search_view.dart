import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/app_sizing.dart';
import 'package:photopulse/core/constant/assets/icons.dart';
import 'package:photopulse/core/styles/app_color.dart';
import 'package:photopulse/core/widgets/custom_svg_image_provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(color: AppColors.secoundaryColor),
        ),
        Positioned(
          bottom: 50.h,
          right: 10.w,
          left: 10.h,
          child: SearchBar(
            hintText: 'Search...',
            hintStyle: WidgetStatePropertyAll(
              TextStyle(
                color: AppColors.black,
                fontSize: AppSizing.captionTextFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: 'Kavoon',
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(
              AppColors.textFormFieldBackGround,
            ),
            leading: CustomSVGImageProvider(
              imagePath: IconsManager.searchIcon,
              width: 24.w,
            ),
            elevation: WidgetStatePropertyAll(0.0),
          ),
        ),
      ],
    );
  }
}
