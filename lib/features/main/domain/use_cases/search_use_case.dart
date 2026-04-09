import 'package:dartz/dartz.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';
import 'package:photopulse/features/main/domain/repository/search_repository.dart';

import '../../../../core/network/exceptions/faild_response_model.dart';

class SearchUseCase {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  Future<Either<FailedResponseModel, SearchResponseModel>> call({required String query}) async {
    return await repository.getPhoto(query:query);
  }
}
