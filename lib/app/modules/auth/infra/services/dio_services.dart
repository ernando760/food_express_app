import 'package:dio/dio.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_services_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/services/i_api_services.dart';
import 'package:food_express_app/app/modules/shared/constant/constant.dart';

class DioServices implements IApiServices {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  @override
  Future<ServiceResponse> get(String path,
      {Object? data, Map<String, dynamic>? queryParamenters}) async {
    try {
      final res = await _dio.get(path,
          data: data,
          queryParameters: queryParamenters,
          options: Options(validateStatus: (status) => true));
      return ServiceResponse(statusCode: res.statusCode, data: res.data);
    } on DioException catch (e) {
      throw GetSevicesException(
          messageError: e.message,
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
          label: "$runtimeType-get",
          stackTrace: e.stackTrace);
    } on DioExceptionType catch (e) {
      if (e == DioExceptionType.connectionError) {
        throw ServicesUnknowException(
            messageError:
                "Error de conexão por favor verifica se você está conectado em uma rede",
            label: "$runtimeType-get");
      }
      throw ServicesUnknowException(
          messageError: "Error no metodo get: $e", label: "$runtimeType-get");
    } catch (e) {
      throw ServicesUnknowException(
          messageError: "Error no metodo get: $e", label: "$runtimeType-get");
    }
  }

  @override
  Future<ServiceResponse> post(String path,
      {Object? data, Map<String, dynamic>? queryParamenters}) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(path,
          data: data,
          queryParameters: queryParamenters,
          options: Options(validateStatus: (status) => true));

      return ServiceResponse(statusCode: res.statusCode, data: res.data);
    } on DioException catch (e) {
      throw PostSevicesException(
          messageError: e.message,
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
          label: "$runtimeType-post",
          stackTrace: e.stackTrace);
    } on DioExceptionType catch (e) {
      if (e == DioExceptionType.connectionError) {
        throw ServicesUnknowException(
            messageError:
                "Error de conexão por favor verifica se você está conectado em uma rede",
            label: "$runtimeType-post");
      }
      throw ServicesUnknowException(
          messageError: "Error no metodo post: $e", label: "$runtimeType-post");
    } catch (e) {
      throw ServicesUnknowException(
          messageError: "Error no metodo post: $e", label: "$runtimeType-post");
    }
  }

  @override
  Future<ServiceResponse> put(String path,
      {Object? data, Map<String, dynamic>? queryParamenters}) async {
    try {
      final res = await _dio.put(path,
          data: data,
          queryParameters: queryParamenters,
          options: Options(validateStatus: (status) => true));
      return ServiceResponse(statusCode: res.statusCode, data: res.data);
    } on DioException catch (e) {
      throw PutSevicesException(
          messageError: e.message,
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
          label: "$runtimeType-put",
          stackTrace: e.stackTrace);
    } on DioExceptionType catch (e) {
      if (e == DioExceptionType.connectionError) {
        throw ServicesUnknowException(
            messageError:
                "Error de conexão por favor verifica se você está conectado em uma rede",
            label: "$runtimeType-put");
      }
      throw ServicesUnknowException(
          messageError: "Error no metodo put: $e", label: "$runtimeType-put");
    } catch (e) {
      throw ServicesUnknowException(
          messageError: "Error no metodo put: $e", label: "$runtimeType-put");
    }
  }

  @override
  Future<ServiceResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamenters,
  }) async {
    try {
      final res = await _dio.delete(path,
          data: data,
          queryParameters: queryParamenters,
          options: Options(validateStatus: (status) => true));
      return ServiceResponse(statusCode: res.statusCode, data: res.data);
    } on DioException catch (e) {
      throw DeleteSevicesException(
          messageError: e.message,
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
          label: "$runtimeType-delete",
          stackTrace: e.stackTrace);
    } on DioExceptionType catch (e) {
      if (e == DioExceptionType.connectionError) {
        throw ServicesUnknowException(
            messageError:
                "Error de conexão por favor verifica se você está conectado em uma rede",
            label: "$runtimeType-delete");
      }
      throw ServicesUnknowException(
          messageError: "Error no metodo delete: $e",
          label: "$runtimeType-delete");
    } catch (e) {
      throw ServicesUnknowException(
          messageError: "Error no metodo delete: $e",
          label: "$runtimeType-delete");
    }
  }
}
