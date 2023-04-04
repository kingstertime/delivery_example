import 'dio_builder.dart';
import 'rest_client.dart';

class ApiClient {
  static ApiClient makeInstance({IDioProvider? dioProvider}) {
    return _instance ??= ApiClient._(dioProvider: dioProvider);
  }

  ApiClient._({IDioProvider? dioProvider})
      : _dio = dioProvider ?? DioBuilder.makeInstance();

  static ApiClient? _instance;
  final IDioProvider _dio;
  RestClient? _client;

  RestClient getClient() {
    // if (_client != null) {
    //   return _client!;
    // }

    return _client ??= RestClient(_dio.dio);
  }
}
