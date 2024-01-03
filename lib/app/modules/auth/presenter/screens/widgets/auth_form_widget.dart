import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/shared/common/show_snack_bar.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

import '../../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/email_text_form_field.dart';
import '../widgets/password_confirm_text_form_field.dart';
import '../widgets/password_text_form_field.dart';
import '../widgets/username_text_form_field.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final GlobalKey<FormState> _forKey = GlobalKey<FormState>();

  late final AuthController _authController;

  _showSnackBarMessageError() {
    final messageError = _authController.state.messageError;
    if (messageError != null) {
      showSnackBar(context, messageError,
          isError: true, duration: const Duration(seconds: 5));
      return;
    }
  }

  _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _authController = Modular.get<AuthController>();
    _authController.addListener(_listener);
  }

  @override
  void dispose() {
    _authController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textAuthButton = _authController.isLogin ? "Login" : "Registrar";
    final textAuthChange = _authController.isLogin
        ? "Você não tem uma conta?"
        : "Você já tem uma conta?";
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/auth_img_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            )),
        Form(
            key: _forKey,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Bem vindo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: iceWhite,
                          fontSize: 40),
                    ),
                    const SizedBox(height: 40),
                    if (!_authController.isLogin) const UsernameTextFormField(),
                    const SizedBox(height: 20),
                    const EmailTextFormField(),
                    const SizedBox(height: 20),
                    const PasswordTextFormField(),
                    const SizedBox(height: 20),
                    if (!_authController.isLogin)
                      const PasswordConfirmTextFormField(),
                    const SizedBox(height: 20),
                    AuthButtom(onPressed: validate, text: textAuthButton),
                    const SizedBox(height: 25),
                    TextButton(
                      onPressed: _authController.toggleTypeAuth,
                      child: Text(textAuthChange,
                          style: const TextStyle(color: iceWhite)),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  void validate() async {
    if (_forKey.currentState!.validate()) {
      if (_authController.isLogin) {
        await _authController.login();
      } else {
        await _authController.register();
      }
      _showSnackBarMessageError();
    }
  }
}
