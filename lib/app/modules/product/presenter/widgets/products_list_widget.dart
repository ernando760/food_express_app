import 'package:flutter/widgets.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/product_card_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const Center(
            child: Text("Lista de produtos está vazia"),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCardWidget(product: products[index]);
            });
  }
}
