import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';

import '../../../shared/constant/colors.dart';

class AmountProductWidget extends StatelessWidget {
  const AmountProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    return ValueListenableBuilder(
      valueListenable: viewModel.amount,
      builder: (context, value, _) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "QTD:",
              style: TextStyle(
                  fontSize: 25, color: matteBlack, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () => viewModel.decrementAmount(),
                icon: const Icon(Icons.remove, color: white),
                style:
                    IconButton.styleFrom(backgroundColor: green, iconSize: 32)),
            const SizedBox(width: 15),
            Text("$value",
                style: const TextStyle(
                    fontSize: 24,
                    color: matteBlack,
                    fontWeight: FontWeight.bold)),
            const SizedBox(width: 15),
            IconButton(
                onPressed: () => viewModel.incrementAmount(),
                icon: const Icon(Icons.add, color: white),
                style:
                    IconButton.styleFrom(backgroundColor: green, iconSize: 32))
          ],
        );
      },
    );
  }
}
