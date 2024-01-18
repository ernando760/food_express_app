import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';
import 'package:food_express_app/app/modules/shared/extensions/money_fomatter_extension.dart';

class PriceProductTotalWidget extends StatelessWidget {
  const PriceProductTotalWidget({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    return ValueListenableBuilder(
        valueListenable: viewModel.amount,
        builder: (context, value, _) {
          return Text(
              "R\$${context.moneyFommater(value * price).output.nonSymbol}",
              style: const TextStyle(
                  fontSize: 25,
                  color: matteBlack,
                  fontWeight: FontWeight.bold));
        });
  }
}
