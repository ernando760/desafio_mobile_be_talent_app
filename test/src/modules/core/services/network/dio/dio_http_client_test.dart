import 'package:desafio_mobile_be_talent_app/src/modules/core/services/network/dio/dio_http_client.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/core/services/network/errors/http_client_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late Dio mockDio;
  late DioHttpClient dioHttpClient;

  setUp(() {
    mockDio = MockDio();
    dioHttpClient = DioHttpClient(mockDio);
  });

  test(
      'Given a request to get employees when the return is successful then it should return the employees',
      () async {
    when(() => mockDio.get(any())).thenAnswer((_) async => makeFakeResponse());

    final response = await dioHttpClient.get("http://localhost:3000/employees");

    expect(
        response.data,
        isA<Map<String, dynamic>>()
            .having((response) => response['data'], 'Data', employees));
  });

  test(
      'Given a request to get employees when the return is failure then it should return exception with message "Erro ao fazer a requisição no método GET!"',
      () async {
    when(() => mockDio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(),
        message: "Erro ao fazer a requisição no método GET!"));

    await expectLater(
      () async => await dioHttpClient.get("http://localhost:3000/employees"),
      throwsA(isA<HttpClientException>().having((error) => error.messageError,
          "MessageError", equals("Erro ao fazer a requisição no método GET!"))),
    );
  });
}
