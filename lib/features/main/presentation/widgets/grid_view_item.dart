import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/app_router/navigate_services.dart';
import 'package:photopulse/core/app_router/screen_routes.dart';
import 'package:photopulse/core/constant/assets/icons.dart';
import 'package:photopulse/core/widgets/custom_svg_image_provider.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';

class GridViewItem extends StatelessWidget {
  final Photos photo;
  final bool favorited;
  final VoidCallback onFavoriteToggle;

  const GridViewItem({
    super.key,
    required this.photo,
    required this.favorited,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = photo.src!.medium!;
    return InkWell(
      onTap: () {
        NavigatorService.pushNamed(AppRouterNames.detailsRoute, arguments: photo);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: InkWell(
                onTap: onFavoriteToggle,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(200),
                    shape: BoxShape.circle,
                  ),
                  child: CustomSVGImageProvider(
                    imagePath: favorited
                        ? IconsManager.favoriteRedIcon
                        : IconsManager.favoriteIcon,
                    width: 24.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}