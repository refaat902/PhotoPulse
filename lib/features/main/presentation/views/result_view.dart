import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/widgets/shimmer_widget.dart';
import 'package:photopulse/core/widgets/texts/caption_text.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is GetSearchResultSuccessState) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  SearchCubit.searchResponseModel!.photos![0].src!.original!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withAlpha(50),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_circle_left_sharp,
                          color: Colors.white,
                        ),
                        label: CaptionText(
                          text: 'Previous',
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withAlpha(50),
                        ),
                        onPressed: () {},
                        child: CaptionText(text: 'Next', color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black.withAlpha(50),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      label: CaptionText(
                        text: 'Add To Favorites',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetSearchResultLoadingState) {
          return Center(
            child: ShimmerWidget(
              height: 400.h,
              width: double.infinity,
              radius: 20.r,
            ),
          );
        }
        return Center(child: CaptionText(text: 'Please start searching'));
      },
    );
  }
}
