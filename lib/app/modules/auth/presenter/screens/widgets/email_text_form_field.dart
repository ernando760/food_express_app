import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/presenter/validator/auth_validator.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';
import '../../controllers/auth_controller.dart';

import 'custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch<AuthController>();
    return CustomTextFormField(
      controller: authController.emailController,
      prefixIcon: const Icon(
        Icons.mail_outline,
        color: iceWhite,
      ),
      hintText: 'Email',
      validator: AuthValidator.validateEmail,
    );
  }
}
