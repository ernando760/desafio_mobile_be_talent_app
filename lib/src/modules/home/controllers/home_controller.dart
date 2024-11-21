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
    await Future.delayed(const Duration(milliseconds: 800));
    final response = await _homeRepository.getAllEmployees();

    final state = response.fold(
        (employees) => LoadedHomeState(employees: employees),
        (exception) => FailureHomeState(messageError: exception.messageError));

    _updateState(state);
  }

  void _updateState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }
}
