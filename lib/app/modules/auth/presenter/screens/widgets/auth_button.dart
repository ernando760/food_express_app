import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class AuthButtom extends StatelessWidget {
  const AuthButtom({super.key, required this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: iceWhite),
      ),
    );
  }
}
