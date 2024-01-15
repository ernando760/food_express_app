import 'package:flutter_test/flutter_test.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/services/i_api_services.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/domain/infra/i_product_repository.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';
import 'package:food_express_app/app/modules/product/infra/product_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_value/mock_value.dart';

class MockApiServices extends Mock implements IApiServices {}

void main() {
  late final IApiServices services;
  late final IProductRepository repository;
  setUpAll(() {
    services = MockApiServices();
    repository = ProductRepository(services);
  });

  test(
      "Should return a products list when i'm call [ProductRepository.getAllProducts] method.",
      () async {
    when(() => services.get(any())).thenAnswer((_) async => ServiceResponse(
        statusCode: 200, data: mockProducts.map((e) => e.toMap()).toList()));

    final (:products, exception: _) = await repository.getAllProducts();

    expect(products, mockProducts);
    expect(products, isA<List<ProductEntity>>());
    expect(products, isNotNull);
    verify(() => services.get(any())).called(1);
  });

  test(
      "Should return an exception when i'm call [ProductRepository.getAllProducts] method.",
      () async {
    when(() => services.get(any()))
        .thenAnswer((_) async => ServiceResponse(statusCode: 404, data: []));

    final (products: _, :exception) = await repository.getAllProducts();

    expect(exception?.messageError,
        productException("Produtos não encontrado").messageError);
    expect(exception, isA<IProductException>());
    expect(exception, isNotNull);
    verify(() => services.get(any())).called(1);
  });
}
