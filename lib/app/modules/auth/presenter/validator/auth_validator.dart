import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_email.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_password.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

class AuthValidator {
  AuthValidator._();
  static UserEntity? _user = UserEntity(
      username: VoText(""), email: VoEmail(""), password: VoPassword(""));

  static String? validateEmail(String? email) {
    _user = _user?.copyWith(email: email);
    return _user?.email.validateEmail("email");
  }

  static String? validatePassword(String? password) {
    _user = _user?.copyWith(password: password);

    return _user?.password.validatePassword("senha");
  }

  static String? validatePasswordConfirm(String? password) {
    if (password != _user?.password.value) {
      return "A Cofirmar a senha não está conrrespondida com a senha.";
    }
    return _user?.password.validatePassword("confirmar senha");
  }

  static String? validateUsername(String? username) {
    _user = _user?.copyWith(username: username);
    return _user?.username.validate("username");
  }
}
