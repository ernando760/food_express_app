import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';

abstract class IProductRepository {
  Future<({List<ProductEntity>? products, IProductException? exception})>
      getAllProducts([int limits = 10]);
}
