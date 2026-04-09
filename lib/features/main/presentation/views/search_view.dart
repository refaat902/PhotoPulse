import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/constant/app_sizing.dart';
import 'package:photopulse/core/constant/assets/icons.dart';
import 'package:photopulse/core/styles/app_color.dart';
import 'package:photopulse/core/widgets/custom_svg_image_provider.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.black,
          fontSize: AppSizing.captionTextFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: 'Kavoon',
        ),
      ),
      controller: searchController,
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
      onSubmitted: (value) =>
          SearchCubit.get(context).getPhoto(context, searchController.text),
    );
  }
}
