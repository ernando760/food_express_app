import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/presenter/controllers/product_controller.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class FailureProductWidget extends StatelessWidget {
  const FailureProductWidget(
      {super.key, required this.messageError, required this.isConnectionError});
  final String messageError;
  final bool isConnectionError;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            messageError,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: matteBlack),
          ),
          const SizedBox(height: 10),
          if (isConnectionError)
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () async =>
                    await context.read<ProductController>().getAllProducts(),
                child: const Text(
                  "Tente novamente",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: white),
                ))
        ],
      ),
    );
  }
}
