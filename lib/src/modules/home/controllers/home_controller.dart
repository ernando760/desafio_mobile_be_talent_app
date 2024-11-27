import 'package:flutter/foundation.dart';

import '../data/repositories/home_repository.dart';
import '../state/home_state.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._homeRepository);

  final HomeRepository _homeRepository;

  HomeState _state = InitialHomeState();

  HomeState get state => _state;

  Future<void> getAllEmployees() async {
    _updateState(LoadingHomeState());

    final response = await _homeRepository.getAllEmployees();

    final state = response.fold(
        (employees) => LoadedHomeState(employees: employees),
        (exception) => FailureHomeState(messageError: exception.messageError));

    _updateState(state);
  }

  void searchEmployeeInfo(String info) {
    if (state is! LoadedHomeState) return;

    final employees = (state as LoadedHomeState).employees;

    info = info.toLowerCase();

    final filteredEmployees = employees
        .where((employee) =>
            employee.name.toLowerCase().contains(info) ||
            employee.job.toLowerCase().contains(info) ||
            employee.phone.contains(info))
        .toList();

    _updateState(LoadedHomeState(
        employees: employees, filteredEmployees: filteredEmployees));
  }

  void _updateState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }
}
