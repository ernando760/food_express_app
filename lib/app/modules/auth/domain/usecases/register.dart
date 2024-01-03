import 'package:food_express_app/app/modules/auth/domain/dto/user_dto.dart';
import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_auth_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/repositories/i_auth_repository.dart';

class Register {
  final IAuthRepository _repository;

  Register(this._repository);

  Future<({UserEntity? user, String token, IAuthException? exception})> call(
      UserDto userDto) async {
    if (userDto.validate()) return await _repository.register(userDto);

    return (
      user: null,
      token: "",
      exception: AuthUnknowException(
          messageError: "O email/senha está invalido.",
          label: "$runtimeType-call")
    );
  }
}
