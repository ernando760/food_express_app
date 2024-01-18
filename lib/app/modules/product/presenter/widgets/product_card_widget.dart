import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/group_stars_widget.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';
import 'package:food_express_app/app/modules/shared/constant/constant.dart';
import 'package:food_express_app/app/modules/shared/extensions/money_fomatter_extension.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: iceWhite,
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.normal,
                offset: const Offset(5, 10),
                color: matteBlack.withOpacity(0.7),
                blurRadius: 20)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image.network(
              "$baseUrl/products${product.imgUrl}",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 25,
                          color: matteBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    GroupStars(rating: product.getAverageRatings()),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(product.description,
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xFF585858))),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "R\$${context.moneyFommater(product.price).output.nonSymbol}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: matteBlack),
                    ),
                    ElevatedButton(
                      onPressed: () => Modular.to
                          .navigate("/product/product", arguments: product),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        "Adicionar no carrinho",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
