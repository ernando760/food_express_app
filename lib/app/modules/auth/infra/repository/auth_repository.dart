import 'package:food_express_app/app/modules/auth/domain/dto/user_dto.dart';
import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_auth_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_services_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/repositories/i_auth_repository.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/services/i_api_services.dart';

class AuthRepository implements IAuthRepository {
  final IApiServices _services;

  AuthRepository(this._services);

  @override
  Future<({IAuthException? exception, String token, UserEntity? user})> login(
      UserDto userDto) async {
    try {
      final res = await _services.post("/auth/signin", data: {
        "email": userDto.email.value,
        "password": userDto.password.value
      });
      if (res.statusCode == 200) {
        final user = UserEntity.fromMap(res.data["user"]);
        final token = res.data["token"] as String;
        return (user: user, token: token, exception: null);
      }
      if (res.statusCode == 401) {
        final message = res.data["message"] as String;
        return (
          user: null,
          token: "",
          exception:
              LoginException(messageError: message, label: "$runtimeType-login")
        );
      }
      return (
        user: null,
        token: "",
        exception: AuthUnknowException(
            messageError: "Error ao fazer o login.",
            label: "$runtimeType-login")
      );
    } on IServicesException catch (e) {
      return (
        user: null,
        token: "",
        exception: LoginException(
            messageError: "${e.messageError}",
            label: "$runtimeType-login -> ${e.label}",
            stackTrace: e.stackTrace)
      );
    } catch (e) {
      return (
        user: null,
        token: "",
        exception: AuthUnknowException(
          messageError: "Error ao fazer o login.",
          label: "$runtimeType-login",
        )
      );
    }
  }

  @override
  Future<({IAuthException? exception, String token, UserEntity? user})>
      register(UserDto userDto) async {
    try {
      final res = await _services.post("/auth/signup", data: {
        "username": userDto.username.value,
        "email": userDto.email.value,
        "password": userDto.password.value
      });

      if (res.statusCode == 200) {
        final user = UserEntity.fromMap(res.data["user"]);
        final token = res.data["token"] as String;
        return (user: user, token: token, exception: null);
      }
      if (res.statusCode == 401) {
        final message = res.data["message"] as String;

        return (
          user: null,
          token: "",
          exception: RegisterException(
              messageError: message, label: "$runtimeType-register")
        );
      }

      return (
        user: null,
        token: "",
        exception: RegisterException(
            messageError: "Error ao fazer o cadastro",
            label: "$runtimeType-register")
      );
    } on IServicesException catch (e) {
      return (
        user: null,
        token: "",
        exception: RegisterException(
            messageError: "${e.messageError}",
            label: "$runtimeType-register -> ${e.label}",
            stackTrace: e.stackTrace)
      );
    } catch (e) {
      return (
        user: null,
        token: "",
        exception: AuthUnknowException(
          messageError: "Error ao fazer o cadastro.",
          label: "$runtimeType-register",
        )
      );
    }
  }
}
