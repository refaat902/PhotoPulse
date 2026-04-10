import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/di/injection_container.dart';
import 'package:photopulse/features/main/presentation/cubits/favorite/cubit/favorite_cubit.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';
import 'package:photopulse/features/main/presentation/views/result_view.dart';
import 'package:photopulse/features/main/presentation/views/search_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<SearchCubit>()),
          BlocProvider(create: (context) => FavoriteCubit()),
        ],
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 65.w,
            left: 20.h,
            right: 20.h,
            bottom: 10.h,
          ),
          child: Column(spacing: 10.h, children: [SearchView(), ResultView()]),
        ),
      ),
    );
  }
}
