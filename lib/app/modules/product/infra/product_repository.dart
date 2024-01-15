// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/foundation.dart';
import 'package:food_express_app/app/modules/auth/domain/errors/i_services_exception.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/services/i_api_services.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/domain/infra/i_product_repository.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';

class ProductRepository extends IProductRepository {
  final IApiServices _services;

  ProductRepository(this._services);
  @override
  Future<({IProductException? exception, List<ProductEntity>? products})>
      getAllProducts([int limits = 10]) async {
    try {
      var products = <ProductEntity>[];
      final res = await _services.get("/products/?limits=$limits");

      if (res.statusCode == 200) {
        products = List.castFrom<dynamic, ProductEntity>(
            res.data.map((e) => ProductEntity.fromMap(e)).toList());

        return (products: products, exception: null);
      }

      if (res.statusCode == 404)
        return (
          products: products,
          exception: ProductUnknowException(
              messageError: "Produtos não encontrado",
              label: "$runtimeType-getAllProducts")
        );

      return (products: <ProductEntity>[], exception: null);
    } on GetSevicesException catch (e) {
      return (
        products: null,
        exception: GetAllProductsException(
            messageError: "${e.messageError}",
            label: "$runtimeType-getAllRespository -> ${e.label}",
            stackTrace: e.stackTrace)
      );
    } catch (e, s) {
      debugPrint("$s");
      return (
        products: null,
        exception: GetAllProductsException(
            messageError: "ERROR: $e",
            label: "$runtimeType-getAllRespository",
            stackTrace: s)
      );
    }
  }
}
