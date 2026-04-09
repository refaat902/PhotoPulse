import 'package:photopulse/features/main/data/models/response/search_response_model.dart';


import '../../../../core/network/dio_service/dio_service.dart';

abstract class SearchDataSource {
  late DioService dioService;

  Future<SearchResponseModel> getPhoto({required String query});

}
