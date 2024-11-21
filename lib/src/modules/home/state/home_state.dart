import 'package:equatable/equatable.dart';

import '../data/models/employee_model.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class InitialHomeState extends HomeState {}

final class LoadingHomeState extends HomeState {}

final class LoadedHomeState extends HomeState {
  LoadedHomeState({required this.employees});

  final List<EmployeeModel> employees;

  @override
  List<Object?> get props => [employees];
}

final class FailureHomeState extends HomeState {
  FailureHomeState({required this.messageError});

  final String messageError;

  @override
  List<Object?> get props => [messageError];
}
