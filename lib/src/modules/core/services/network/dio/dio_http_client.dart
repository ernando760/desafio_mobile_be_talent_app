import 'package:dio/dio.dart';

import '../errors/http_client_exception.dart';
import '../interfaces/i_http_client.dart';

class DioHttpClient implements IHttpClient {
  DioHttpClient(this._dio);

  final Dio _dio;

  @override
  Future<HttpClientResponse> get(String path) async {
    try {
      final response = await _dio.get(path);

      final data = {
        "data": response.data ?? {},
      };

      return HttpClientResponse(
        data: data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e, s) {
      throw HttpClientException(
          label: "$runtimeType.get",
          statusCode: e.response?.statusCode,
          messageError: e.message ?? "",
          stackTrace: s);
    }
  }
}
