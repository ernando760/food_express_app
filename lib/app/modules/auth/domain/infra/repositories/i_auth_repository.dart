import '../../entity/user_entity.dart';
import '../../errors/i_auth_exception.dart';
import '../../dto/user_dto.dart';

abstract class IAuthRepository {
  Future<({UserEntity? user, String token, IAuthException? exception})> login(
      UserDto userDto);
  Future<({UserEntity? user, String token, IAuthException? exception})>
      register(UserDto userDto);
}
