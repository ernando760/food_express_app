import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/presenter/validator/auth_validator.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

import '../../controllers/auth_controller.dart';
import 'custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch<AuthController>();
    return AnimatedBuilder(
      animation: authController,
      builder: (context, _) {
        final visibilityPasswordIcon = authController.isVibilityPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined;
        return CustomTextFormField(
          controller: authController.passwordController,
          obscureText: authController.isVibilityPassword,
          hintText: 'Senha',
          prefixIcon: IconButton(
              onPressed: authController.toggleVisibilityPassword,
              icon: Icon(visibilityPasswordIcon, color: iceWhite)),
          validator: AuthValidator.validatePassword,
        );
      },
    );
  }
}
