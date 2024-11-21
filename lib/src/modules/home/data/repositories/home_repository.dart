import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../core/services/network/errors/http_client_exception.dart';
import '../../../core/services/network/interfaces/i_http_client.dart';
import '../errors/repository_exception.dart';
import '../models/employee_model.dart';

class HomeRepository {
  HomeRepository(this._httpClient);

  final IHttpClient _httpClient;

  Future<Result<List<EmployeeModel>, RepositoryException>>
      getAllEmployees() async {
    try {
      final response = await _httpClient.get("/employees");

      if (!_isSuccessStatusCode(response.statusCode)) {
        return Failure(HomeRepositoryException(
            label:
                "$runtimeType.getAllEmployees |> status code: ${response.statusCode}",
            messageError:
                "Não foi possivel obter os funcionários, por favor tente mais tarde!"));
      }

      final employeesModels = _parseEmployees(response.data);

      return Success(employeesModels);
    } on HttpClientException catch (error) {
      log("Erro|> ${error.messageError} | Status code|> ${error.statusCode}",
          name: "$runtimeType.getAllEmployees");
      return Failure(HomeRepositoryException(
        label: "$runtimeType.getAllEmployees => ${error.label}",
        messageError:
            "Não foi possivel obter os funcionários, por favor tente mais tarde!",
        stackTrace: error.stackTrace,
      ));
    } catch (error, s) {
      log(error.toString(), name: "$runtimeType.getAllEmployees");
      return Failure(HomeRepositoryException(
          label: "$runtimeType.getAllEmployees",
          messageError:
              "Ocorreu um erro inesperado, por favor tente mais tarde!",
          stackTrace: s));
    }
  }

  bool _isSuccessStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  List<EmployeeModel> _parseEmployees(Map<String, dynamic>? data) {
    if (data == null || data['data'] == null) return [];

    final employeesMaps =
        List.castFrom<dynamic, Map<String, dynamic>>(data['data']);
    return employeesMaps.map((data) => EmployeeModel.fromMap(data)).toList();
  }
}
