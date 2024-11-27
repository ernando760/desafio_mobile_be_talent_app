import 'package:desafio_mobile_be_talent_app/src/modules/core/services/network/interfaces/i_http_client.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/models/employee_model.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/data/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockHttpClient extends Mock implements IHttpClient {}

class MockHomeRepository extends Mock implements HomeRepository {}

Response<List<Map<String, dynamic>>> makeFakeResponse() => Response(
      requestOptions: RequestOptions(),
      data: employees,
      statusCode: 200,
    );

const employees = [
  {
    "id": 1,
    "name": "João",
    "job": "Back-end",
    "admission_date": "2019-12-02T00:00:00.000Z",
    "phone": "5551234567890",
    "image":
        "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
  },
  {
    "id": 2,
    "name": "Roberto",
    "job": "Front-end",
    "admission_date": "2020-03-12T00:00:00.000Z",
    "phone": "5550321654789",
    "image":
        "https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png"
  },
  {
    "id": 3,
    "name": "Maria",
    "job": "Front-end",
    "admission_date": "2020-03-15T00:00:00.000Z",
    "phone": "5557894561230",
    "image":
        "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
  },
  {
    "id": 4,
    "name": "Cleber",
    "job": "Back-end",
    "admission_date": "2020-06-01T00:00:00.000Z",
    "phone": "5557410258963",
    "image":
        "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
  },
  {
    "id": 5,
    "name": "Giovana",
    "job": "Designer",
    "admission_date": "2020-06-20T00:00:00.000Z",
    "phone": "5553698520147",
    "image":
        "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
  },
];

final employeesModel =
    employees.map((map) => EmployeeModel.fromMap(map)).toList();
