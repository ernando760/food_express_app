import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

class VoEmail extends VoText {
  VoEmail(super.value);

  String? validateEmail([String? label = "texto"]) {
    const regexEmail = r"^[a-z].+@[a-z,A-Z].+\..+[A-Z,a-z]";
    if (!RegExp(regexEmail).hasMatch(value)) {
      return "O email está invalido!";
    }
    final res = super.validate("email");
    if (res != null) return res;

    return null;
  }
}
