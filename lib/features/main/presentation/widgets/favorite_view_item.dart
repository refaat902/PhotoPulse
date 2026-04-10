import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteViewItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onFavoriteToggle;
  const FavoriteViewItem({super.key, required this.imageUrl, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}