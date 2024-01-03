import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

class VoPassword extends VoText {
  VoPassword(super.value);

  String? validatePassword([String? label = "text"]) {
    if (value.length <= 6) {
      return "A senha de ser maior ou igual a 6 caracteres.";
    }
    final res = super.validate("password");
    if (res != null) return res;

    return null;
  }
}
