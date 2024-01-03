import 'package:flutter_test/flutter_test.dart';
import 'package:food_express_app/app/modules/auth/domain/dto/user_dto.dart';
import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_auth_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/usecases/register.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_email.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_password.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';
import 'package:mocktail/mocktail.dart';

class MockRegister extends Mock implements Register {}

class FakeUserDto extends Fake implements UserDto {}

void main() {
  late final MockRegister usecase;

  setUpAll(() {
    usecase = MockRegister();
    registerFallbackValue(FakeUserDto());
  });
  test('It should return the user and the token when making the register.',
      () async {
    final testUser = UserEntity(
        username: VoText("username"),
        email: VoEmail("email@email.com"),
        password: VoPassword("password"));
    when(() => usecase.call(any())).thenAnswer(
        (_) async => (user: testUser, token: "token", exception: null));

    final (:user, :token, exception: _) = await usecase.call(UserDto(
        username: VoText("username"),
        email: VoEmail("email@email.com"),
        password: VoPassword("password")));

    expect(user, isNotNull);
    expect(token, "token");
    expect(user?.validate(), true);
    verify(() => usecase.call(any())).called(1);
  });

  test('It should return the exception when making the register.', () async {
    when(() => usecase.call(any())).thenAnswer((_) async => (
          user: null,
          token: "",
          exception: AuthUnknowException(
              messageError: "O email/senha está invalido.", label: "label")
        ));

    final (user: _, token: _, :exception) = await usecase.call(UserDto(
        username: VoText("username"),
        email: VoEmail("email@.com"),
        password: VoPassword("pass")));

    expect(exception?.messageError, "O email/senha está invalido.");
    verify(() => usecase.call(any())).called(1);
  });
}
