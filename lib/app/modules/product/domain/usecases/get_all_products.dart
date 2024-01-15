import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/domain/infra/i_product_repository.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';

class GetAllProducts {
  final IProductRepository _repository;

  GetAllProducts(this._repository);
  Future<({List<ProductEntity>? products, IProductException? exception})> call(
      [int limits = 10]) async {
    return await _repository.getAllProducts(limits);
  }
}
