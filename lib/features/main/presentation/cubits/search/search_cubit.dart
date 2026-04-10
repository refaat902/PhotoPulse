// 

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:photopulse/core/constant/error_messages.dart';
import 'package:photopulse/core/utils/toast.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';
import 'package:photopulse/features/main/domain/use_cases/search_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  SearchCubit({required this.searchUseCase}) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  static SearchResponseModel? searchResponseModel;

  String _currentQuery = '';
  int _currentPage = 1;
  final List<int> _pageHistory = []; // stack of previous page numbers

  bool get hasPreviousPage => _pageHistory.isNotEmpty;
  bool get hasNextPage => searchResponseModel?.nextPage != null;
  int get currentPage => _currentPage;

  Future<void> getPhoto(BuildContext context, String query) async {
    _currentQuery = query;
    _currentPage = 1;
    _pageHistory.clear();
    await _fetchPage(page: 1);
  }

  Future<void> nextPage() async {
    if (!hasNextPage) return;
    _pageHistory.add(_currentPage);
    _currentPage++;
    await _fetchPage(page: _currentPage);
  }

  Future<void> previousPage() async {
    if (!hasPreviousPage) return;
    _currentPage = _pageHistory.removeLast();
    await _fetchPage(page: _currentPage);
  }

  Future<void> _fetchPage({required int page}) async {
    emit(GetSearchResultLoadingState());
    final result = await searchUseCase.call(query: _currentQuery, page: page);
    try {
      result.fold(
        (l) {
          showToast(text: l.message!, state: ToastStates.ERROR);
          emit(GetSearchResultErrorState());
        },
        (r) {
          searchResponseModel = r;
          emit(GetSearchResultSuccessState());
        },
      );
    } catch (error) {
      showToast(
        text: ErrorMessages.Server_Request_En_Error,
        state: ToastStates.ERROR,
      );
      emit(GetSearchResultErrorState());
    }
  }
}