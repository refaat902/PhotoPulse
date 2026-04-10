import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/app_router/navigate_services.dart';
import 'package:photopulse/core/widgets/texts/caption_text.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';

class DetailsScreen extends StatelessWidget {
  final Photos photo;
  const DetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final imageUrl = photo.src!.medium!;

    return Scaffold(
      body: Column(
        spacing: 10.h,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                left: 10.w,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.black.withAlpha(100),
                    ),
                    shape: WidgetStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: () {
                    NavigatorService.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          CaptionText(text: 'Photo ID: ${photo.id}'),
          CaptionText(text: 'Photographer: ${photo.photographer}'),
        ],
      ),
    );
  }
}
