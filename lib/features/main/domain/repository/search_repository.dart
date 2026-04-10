import 'package:dartz/dartz.dart';
import 'package:photopulse/features/main/data/data_source/search_data_source.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';

import '../../../../core/network/exceptions/faild_response_model.dart';
import '../../../../core/shared_preferences/preference_helper.dart';

abstract class SearchRepository {
  late SearchDataSource searchDataSource;
  late PreferenceHelper preferenceHelper;


  Future<Either<FailedResponseModel, SearchResponseModel>> getPhoto({required String query,int? page});

}