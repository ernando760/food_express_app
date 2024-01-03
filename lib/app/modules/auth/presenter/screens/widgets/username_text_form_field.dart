import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/presenter/validator/auth_validator.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

import '../../controllers/auth_controller.dart';
import 'custom_text_form_field.dart';

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch<AuthController>();
    return CustomTextFormField(
      controller: authController.usernameController,
      hintText: 'Nome do usúario',
      prefixIcon: const Icon(
        Icons.person_outline,
        color: iceWhite,
      ),
      validator: AuthValidator.validateUsername,
    );
  }
}
