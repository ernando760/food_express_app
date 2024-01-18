import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/custom_app_bar.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/failure_product_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/loading_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/product_state_builder.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/products_list_widget.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductViewModel>((bind) => bind.state);
    return Scaffold(
      appBar: const CustomAppBar(title: "Food Express"),
      body: ProductStateBuilder(
        onInit: () => Future(() async => controller.getAllProducts()),
        loading: () => const LoadingWidget(),
        loaded: (products) => ProductsListWidget(products: products ?? []),
        failure: (messageError, isConnectionError) => FailureProductWidget(
            messageError: messageError!, isConnectionError: isConnectionError),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: red,
        onPressed: () {},
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: white,
        ),
      ),
    );
  }
}
