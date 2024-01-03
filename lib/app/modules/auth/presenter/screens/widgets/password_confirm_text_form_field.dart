import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/presenter/validator/auth_validator.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

import '../../controllers/auth_controller.dart';
import 'custom_text_form_field.dart';

class PasswordConfirmTextFormField extends StatelessWidget {
  const PasswordConfirmTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch<AuthController>();
    return AnimatedBuilder(
      animation: authController,
      builder: (context, _) {
        final visibilityPasswordConfirmIcon =
            authController.isVibilityPasswordConfirm
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined;
        return CustomTextFormField(
          controller: authController.passwordConfirmController,
          obscureText: authController.isVibilityPasswordConfirm,
          hintText: 'Senha',
          prefixIcon: IconButton(
              onPressed: authController.toggleVisibilityPasswordConfirm,
              icon: Icon(visibilityPasswordConfirmIcon, color: iceWhite)),
          validator: AuthValidator.validatePasswordConfirm,
        );
      },
    );
  }
}
