import 'package:desafio_mobile_be_talent_app/src/modules/core/services/network/errors/http_client_exception.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/core/services/network/interfaces/i_http_client.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/errors/repository_exception.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/models/employee_model.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/repositories/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  late IHttpClient httpClient;
  late HomeRepository homeRepository;

  setUp(() {
    httpClient = MockHttpClient();
    homeRepository = HomeRepository(httpClient);
  });

  test(
      'Given a request to get all employees when the return is successful then it should return the employees',
      () async {
    when(() => httpClient.get(any())).thenAnswer(
      (_) async =>
          HttpClientResponse(data: {"data": employees}, statusCode: 200),
    );

    final response = await homeRepository.getAllEmployees();

    final successData = response.getOrNull();

    expect(successData, isNotNull);
    expect(successData, isA<List<EmployeeModel>>());
    expect(successData?.length, 5);

    verify(() => httpClient.get(any())).called(1);
  });

  test(
      'Given a request to get employees when the return is failure then it should return exception with message "Não foi possivel obter os funcionários, por favor tente mais tarde!"',
      () async {
    when(() => httpClient.get(any())).thenThrow(HttpClientException(
        label: "HttpClientException.get",
        statusCode: 404,
        messageError: "Ocorreu um erro inesperado por favor tente mais tarde"));

    final response = await homeRepository.getAllEmployees();

    final failureData = response.exceptionOrNull();

    expect(failureData, isNotNull);
    expect(
        failureData,
        isA<HomeRepositoryException>().having(
            (error) => error.messageError,
            "Message error",
            equals(
                "Não foi possivel obter os funcionários, por favor tente mais tarde!")));

    verify(() => httpClient.get(any())).called(1);
  });
}
