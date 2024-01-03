abstract class IApiServices {
  Future<ServiceResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamenters,
  });
  Future<ServiceResponse> post(String path,
      {Object? data, Map<String, dynamic>? queryParamenters});
  Future<ServiceResponse> delete(String path,
      {Object? data, Map<String, dynamic>? queryParamenters});
  Future<ServiceResponse> put(String path,
      {Object? data, Map<String, dynamic>? queryParamenters});
}

class ServiceResponse {
  final int? statusCode;
  final dynamic data;

  ServiceResponse({required this.statusCode, required this.data});
}
