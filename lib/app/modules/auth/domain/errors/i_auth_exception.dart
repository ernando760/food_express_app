// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IAuthException {
  String messageError;
  String label;
  StackTrace? stackTrace;
  IAuthException(
      {required this.messageError, required this.label, this.stackTrace});
}

class LoginException extends IAuthException {
  LoginException(
      {required super.messageError, required super.label, super.stackTrace});
}

class RegisterException extends IAuthException {
  RegisterException(
      {required super.messageError, required super.label, super.stackTrace});
}

class AuthUnknowException extends IAuthException {
  AuthUnknowException(
      {required super.messageError, required super.label, super.stackTrace});
}
