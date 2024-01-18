// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.title,
      this.style,
      this.textStyle,
      required this.onPressed})
      : super(key: key);
  final String title;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ??
              const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: white),
        ));
  }
}
