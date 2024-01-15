import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: red,
      ),
    );
  }
}
