import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photopulse/core/widgets/shimmer_widget.dart';
import 'package:photopulse/features/main/presentation/cubits/favorite/cubit/favorite_cubit.dart';
import 'package:photopulse/features/main/presentation/widgets/favorite_view_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavoriteCubit(),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final favCubit = context.read<FavoriteCubit>();
            if (state is FavoriteLoading) {
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
            final favorites = favCubit.favorites;

            if (favorites.isEmpty) {
              return const Center(child: Text('No favorites yet.'));
            }

            return Padding(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
                bottom: 10.h,
              ),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return FavoriteViewItem(
                    imageUrl: item.imageUrl,
                    onFavoriteToggle: () =>
                        favCubit.toggleFavorite(item.id, item.imageUrl),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
