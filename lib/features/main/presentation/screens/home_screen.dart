import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/di/injection_container.dart';
import 'package:photopulse/features/main/presentation/cubits/search/search_cubit.dart';
import 'package:photopulse/features/main/presentation/views/result_view.dart';
import 'package:photopulse/features/main/presentation/views/search_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SearchCubit>(),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 45.h ,horizontal: 20.w),
          child: Column(spacing: 20.h, children: [SearchView(), Expanded(child: ResultView())]),
        ),
      ),
    );
  }
}
