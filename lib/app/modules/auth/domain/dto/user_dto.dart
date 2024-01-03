import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';

class UserDto extends UserEntity {
  UserDto(
      {required super.username, required super.email, required super.password});
}
