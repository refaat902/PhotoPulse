import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photopulse/core/widgets/shimmer_widget.dart';
import 'package:photopulse/core/widgets/texts/caption_text.dart';
import 'package:photopulse/features/main/presentation/cubits/favorite/cubit/favorite_cubit.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';
import 'package:photopulse/features/main/presentation/widgets/grid_view_item.dart';
import 'package:photopulse/features/main/presentation/widgets/page_controllers.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is GetSearchResultSuccessState) {
          final searchCubit = context.read<SearchCubit>();
          return BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, favoriteState) {
              final favCubit = context.read<FavoriteCubit>();
              return Column(
                children: [
                  MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    itemCount: SearchCubit.searchResponseModel!.photos!.length,
                    itemBuilder: (context, index) {
                      final photo =
                          SearchCubit.searchResponseModel!.photos![index];
                      final id = photo.id.toString();
                      final imageUrl = photo.src!.medium!;
                      final favorited = favCubit.isFavorite(id);
                      return GridViewItem(
                        photo: photo,
                        favorited: favorited,
                        onFavoriteToggle: () =>
                            favCubit.toggleFavorite(id, imageUrl),
                      );
                    },
                  ),
                  PageControllers(
                    hasPreviousPage: searchCubit.hasPreviousPage,
                    hasNextPage: searchCubit.hasNextPage,
                    currentPage: searchCubit.currentPage,
                    onPrevious: () => searchCubit.previousPage(),
                    onNext: () => searchCubit.nextPage(),
                  ),
                ],
              );
            },
          );
        } else if (state is GetSearchResultLoadingState) {
          return MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            itemCount: 6,
            itemBuilder: (context, index) => ShimmerWidget(
              height: 400.h,
              width: double.infinity,
              radius: 20.r,
            ),
          );
        }
        return const Center(child: CaptionText(text: 'Please start searching'));
      },
    );
  }
}
