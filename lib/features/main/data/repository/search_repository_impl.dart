import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:photopulse/core/shared_preferences/preference_helper.dart';
import 'package:photopulse/features/main/data/data_source/search_data_source.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';
import 'package:photopulse/features/main/domain/repository/search_repository.dart';
import '../../../../core/constant/error_messages.dart';
import '../../../../core/network/exceptions/error_exception.dart';
import '../../../../core/network/exceptions/faild_response_model.dart';
import '../../../../core/network/exceptions/network_exception.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  // ignore: overridden_fields
  SearchDataSource searchDataSource;
  @override
  // ignore: overridden_fields
  PreferenceHelper preferenceHelper;

  SearchRepositoryImpl({
    required this.searchDataSource,
    required this.preferenceHelper,
  });

  @override
  Future<Either<FailedResponseModel, SearchResponseModel>> getPhoto({required String query,int? page}) async {
    try {
      final result = await searchDataSource.getPhoto(query: query, page: page);

      // final userEntity = UserMapper.toUserEntity(
      //   userData: result.data!.account!,
      //   percentage: result.data!.percentage,
      //   profileQrCodeImage: result.data!.qrImage,
      //   memberShipId: result.data!.membershipId,
      // );
      return Right(result);
    } on ErrorException catch (e) {
      debugPrint(e.toString());
      return Left(
        FailedResponseModel(
          status: e.status,
          message: e.message,
          errors: e.error,
        ),
      );
    } on NetworkException {
      return Left(
        FailedResponseModel(message: ErrorMessages.Network_Connection_En_Error),
      );
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        FailedResponseModel(message: ErrorMessages.Server_Request_En_Error),
      );
    }
  }
}
