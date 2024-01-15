import 'package:flutter_test/flutter_test.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/domain/infra/i_product_repository.dart';
import 'package:food_express_app/app/modules/product/domain/usecases/get_all_products.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_value/mock_value.dart';

class MockProductRepository extends Mock implements IProductRepository {}

void main() {
  late final GetAllProducts usecase;
  late final IProductRepository repository;
  setUpAll(() {
    repository = MockProductRepository();
    usecase = GetAllProducts(repository);
  });
  test("Should return a products list when i'm call the [usecase] method.",
      () async {
    when(() => repository.getAllProducts())
        .thenAnswer((_) async => (products: mockProducts, exception: null));

    final (:products, exception: _) = await usecase();

    expect(products, isA<List<ProductEntity>>());
    expect(products, mockProducts);
    verify(() => repository.getAllProducts()).called(1);
  });

  test("Should return an exception when i'm call the [usecase] method.",
      () async {
    when(() => repository.getAllProducts()).thenAnswer((_) async => (
          products: null,
          exception: productException("Error ao obter os produtos.")
        ));

    final (products: _, :exception) = await usecase();

    expect(exception, isA<IProductException>());
    expect(exception?.messageError,
        productException("Error ao obter os produtos.").messageError);
    verify(() => repository.getAllProducts()).called(1);
  });
}
