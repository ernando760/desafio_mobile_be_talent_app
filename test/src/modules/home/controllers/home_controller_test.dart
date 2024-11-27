import 'package:desafio_mobile_be_talent_app/src/modules/home/controllers/home_controller.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/errors/repository_exception.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/repositories/home_repository.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/state/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mocks/mocks.dart';

void main() {
  late HomeRepository homeRepository;
  late HomeController homeController;

  setUp(() {
    homeRepository = MockHomeRepository();
    homeController = HomeController(homeRepository);
  });
  test(
      'Given a request to get all employees when the return is successful then it should return the state LoadedHomeState',
      () async {
    when(() => homeRepository.getAllEmployees())
        .thenAnswer((_) async => Success(employeesModel));

    await homeController.getAllEmployees();

    final state = homeController.state;

    expect(
        state,
        isA<LoadedHomeState>()
            .having((state) => state.employees, "employees", employeesModel));

    verify(() => homeRepository.getAllEmployees()).called(1);
  });

  test(
      'Given a request to get all employees when the return is failure then it should return the state FailureHomeState',
      () async {
    when(() => homeRepository.getAllEmployees()).thenAnswer((_) async =>
        Failure(HomeRepositoryException(
            label: "HomeRepository.getAllEmployees",
            messageError:
                "Não foi possivel obter os funcionários, por favor tente mais tarde!")));

    await homeController.getAllEmployees();

    final state = homeController.state;

    expect(
        state,
        isA<FailureHomeState>().having(
            (state) => state.messageError,
            "Message Error",
            equals(
                "Não foi possivel obter os funcionários, por favor tente mais tarde!")));

    verify(() => homeRepository.getAllEmployees()).called(1);
  });
}
