import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {bool isError = false, Duration duration = const Duration(seconds: 3)}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: duration,
    content: Text(
      message,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFF7FFF7)),
    ),
    backgroundColor:
        isError ? const Color(0xFFFF220C) : const Color(0xFF60935D),
  ));
}
