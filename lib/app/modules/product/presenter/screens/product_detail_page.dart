// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/amount_product_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/custom_app_bar.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/custom_button_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/group_stars_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/price_product_total_widget.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/product_comment_draggable_scrollable_sheet_widget.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';
import 'package:food_express_app/app/modules/shared/constant/constant.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
        leading: IconButton(
            onPressed: () => Modular.to.navigate("/product"),
            icon: const Icon(Icons.arrow_back, color: white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Componentes da imagem do produto
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                        "$baseUrl/products${product.imgUrl}",
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(height: 5),
                // Componentes de descriçao
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Decrição:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: matteBlack,
                                  fontWeight: FontWeight.w600)),
                          GroupStars(rating: product.getAverageRatings())
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(product.description,
                            style: const TextStyle(
                                fontSize: 15, color: matteBlack)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Componentes button card e amount
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AmountProductWidget(),
                          PriceProductTotalWidget(price: product.price)
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButtonWidget(
                        title: "Adicionar no carrinho",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox.expand(
              child: ProductCommentDraggableScrollableSheetWidget(
                  comments: product.comments),
            )
          ],
        ),
      ),
    );
  }
}
