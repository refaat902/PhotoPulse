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

  Future<void> getPhoto(BuildContext context, String query) async {
    emit(GetSearchResultLoadingState());
    final result = await searchUseCase.call(query: query);
    try {
      result.fold(
        (l) {
          print("zzzzzzzzzzzzzzzzzzzzz");
          print(l.message);
          print("zzzzzzzzzzzzzzzzzzzzzzzz");
          showToast(text: l.message!, state: ToastStates.ERROR);
          emit(GetSearchResultErrorState());
        },
        (r) {
          searchResponseModel = r;
          emit(GetSearchResultSuccessState());
        },
      );
    } catch (error) {
      print("zzzzzzzzzzzzzzzzzzzz");
      print(error.toString());
      print("zzzzzzzzzzzzzzzzzzzz");
      showToast(
        text: ErrorMessages.Server_Request_En_Error,
        state: ToastStates.ERROR,
      );
      emit(GetSearchResultErrorState());
    }
  }
}
