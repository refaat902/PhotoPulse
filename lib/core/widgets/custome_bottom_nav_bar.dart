import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/assets/icons.dart';
import 'package:photopulse/core/styles/app_color.dart';
import 'package:photopulse/core/widgets/custom_svg_image_provider.dart';
import 'package:photopulse/core/widgets/texts/body_text.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });
  final notSelectedIcons = [IconsManager.homeIcon, IconsManager.favoriteIcon];
  final titles = ['Home', 'Favorites'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(2, (index) {
          final isActive = currentIndex == index;

          return InkWell(
            onTap: () => onItemSelected(index),
            child: Column(
              spacing: 10.h,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 2.h,
                  width: 56.w,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.secoundaryColor
                        : Colors.transparent,
                  ),
                ),

                CustomSVGImageProvider(
                  imagePath: notSelectedIcons[index],
                  iamgeColor: isActive ? AppColors.secoundaryColor : null,
                  width: isActive? 30.w:24.w,
                ),
                BodyText(
                  text: titles[index],
                  color: isActive
                      ? AppColors.secoundaryColor
                      : AppColors.black,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
