import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';

class GroupStars extends StatelessWidget {
  const GroupStars({super.key, required this.rating, this.iconSize});
  final double rating;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    return Row(
      children: viewModel.startProductBuilder(rating, size: iconSize),
    );
  }
}
