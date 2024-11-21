abstract interface class IHttpClient {
  Future<HttpClientResponse> get(String path);
}

class HttpClientResponse {
  HttpClientResponse({required this.data, this.statusCode});

  final Map<String, dynamic> data;
  final int? statusCode;
}
