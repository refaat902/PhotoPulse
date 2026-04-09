import 'package:photopulse/features/main/data/data_source/search_data_source.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';
import '../../../../core/network/dio_service/dio_method.dart';
import '../../../../core/network/dio_service/dio_service.dart';
import '../../../../core/network/exceptions/error_exception.dart';
import '../../../../core/network/network_urls/network_urls.dart';

class SearchDataSourceImpl implements SearchDataSource {
  @override
  DioService dioService;

  SearchDataSourceImpl({required this.dioService});
  @override
  Future<SearchResponseModel> getPhoto({required String query}) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: NetworkURLS.searchEndPoint,
        apiToken: 'pxUPRMD1pBQyVaNkrTxQZtnPWRT4noSHFBxGRVUNNkwzNSq3SJwsFqJC',
        query: {'query': query},
        
      ),
    );
    if (result is! Map<String, dynamic>) {
      throw ErrorException(
        message: 'Unexpected response type: ${result.runtimeType}',
      );
    }
    final response = SearchResponseModel.fromJson(result);
    return response;
  }
}
