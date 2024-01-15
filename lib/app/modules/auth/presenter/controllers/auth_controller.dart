import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/core/local/i_local_storage.dart';
import 'package:food_express_app/app/modules/auth/domain/dto/user_dto.dart';
import 'package:food_express_app/app/modules/auth/domain/entity/user_entity.dart';
import 'package:food_express_app/app/modules/auth/domain/usecases/login.dart';
import 'package:food_express_app/app/modules/auth/domain/usecases/register.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_email.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_password.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

import 'package:food_express_app/app/modules/auth/presenter/states/auth_state.dart';

class AuthController extends ChangeNotifier {
  final Login _login;
  final Register _register;
  final ILocalStorage _localStorage;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  AuthController(
    this._login,
    this._register,
    this._localStorage,
  ) {
    checkUserLogged();
  }

  bool isVibilityPassword = true;
  bool isVibilityPasswordConfirm = true;
  bool isLogin = true;

  AuthState _state = InitialAuthState();

  AuthState get state => _state;

  bool get isLogged => state.user != null;
  Future<bool> checkConnectivity() async {
    final connectivity = await (Connectivity().checkConnectivity());

    if (connectivity == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  Future<void> login() async {
    _emit(LoadingAuthState());
    final isConnected = await checkConnectivity();
    if (!isConnected) {
      _emit(FailureAuthState(
          messageError: "O dispositivo está desconectado na Internet"));
      return;
    }

    final (:user, :token, :exception) = await _login.call(UserDto(
        username: VoText(usernameController.text.isNotEmpty
            ? usernameController.text
            : "username"),
        email: VoEmail(emailController.text),
        password: VoPassword(passwordController.text)));

    if (exception != null) {
      _emit(FailureAuthState(messageError: exception.messageError));
      return;
    }
    await _localStorage.save("token", token);
    await _localStorage.save("user", user!.toJson());

    _clean();
    _emit(LoadedAuthState(user: user));
  }

  Future<void> register() async {
    _emit(LoadingAuthState());
    final isConnected = await checkConnectivity();
    if (!isConnected) {
      _emit(FailureAuthState(
          messageError: "O dispositivo está desconectado na Internet"));
      return;
    }

    final (:user, :token, :exception) = await _register.call(UserDto(
        username: VoText(usernameController.text.isNotEmpty
            ? usernameController.text
            : "username"),
        email: VoEmail(emailController.text),
        password: VoPassword(passwordController.text)));

    if (exception != null) {
      _emit(FailureAuthState(messageError: exception.messageError));
      return;
    }

    await _localStorage.save("token", token);
    await _localStorage.save("user", user!.toJson());

    _clean();
    _emit(LoadedAuthState(user: user));
  }

  Future<void> signOut() async {
    _emit(LoadingAuthState());
    await _localStorage.remove("token");
    await _localStorage.remove("user");
    _emit(LoadedAuthState());
  }

  Future<void> checkUserLogged() async {
    _emit(LoadingAuthState());

    final token = await _localStorage.get("token");
    final userString = await _localStorage.get("user");

    if (token != null && userString != null) {
      final user = UserEntity.fromJson(userString);
      _emit(LoadedAuthState(user: user));
      return;
    }

    _emit(LoadedAuthState());
  }

  void _emit(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();

    super.dispose();
  }

  void _clean() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
  }

  void toggleVisibilityPassword() {
    isVibilityPassword = !isVibilityPassword;
    notifyListeners();
  }

  void toggleVisibilityPasswordConfirm() {
    isVibilityPasswordConfirm = !isVibilityPasswordConfirm;
    notifyListeners();
  }

  void toggleTypeAuth() {
    isLogin = !isLogin;
    usernameController.clear();
    notifyListeners();
  }
}
