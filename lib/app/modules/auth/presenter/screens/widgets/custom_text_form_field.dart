import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.validator,
      this.obscureText = false});

  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      obscureText: obscureText,
      cursorColor: iceWhite,
      style: const TextStyle(color: iceWhite),
      decoration: InputDecoration(
          errorStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(
              color: iceWhite, fontSize: 15, fontWeight: FontWeight.w600),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: green, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: iceWhite, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: iceWhite, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      validator: validator,
    );
  }
}
