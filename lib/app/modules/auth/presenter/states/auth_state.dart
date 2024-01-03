import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';

sealed class AuthState {
  final UserEntity? user;

  final String? messageError;

  AuthState({this.user, this.messageError});
}

final class InitialAuthState extends AuthState {
  InitialAuthState({super.user, super.messageError});
}

final class LoadingAuthState extends AuthState {
  LoadingAuthState({super.user, super.messageError});
}

final class LoadedAuthState extends AuthState {
  LoadedAuthState({super.user, super.messageError});
}

final class FailureAuthState extends AuthState {
  FailureAuthState({super.user, super.messageError});
}
