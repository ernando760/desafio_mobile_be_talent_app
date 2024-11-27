import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/network/dio/dio_http_client.dart';
import 'services/network/interfaces/i_http_client.dart';

final class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    const urlApi = String.fromEnvironment("API_URL");
    i.addInstance<Dio>(Dio(BaseOptions(baseUrl: urlApi)));
    i.add<IHttpClient>(DioHttpClient.new);
  }
}
