import 'package:flutter_test/flutter_test.dart';
import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_email.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_password.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

void main() {
  test('Should create user and validate the fields and return true', () async {
    final user = UserEntity(
        username: VoText("fulano"),
        email: VoEmail("fulano@testando.com"),
        password: VoPassword("password"));

    expect(user.validate(), true);
  });

  test('Should create user and validate the fields and return false.',
      () async {
    final user = UserEntity(
        username: VoText("fulano"),
        email: VoEmail("fulano@.com"),
        password: VoPassword("password"));

    expect(user.validate(), false);
  });
}
