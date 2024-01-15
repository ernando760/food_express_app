import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';

sealed class ProductState {
  final List<ProductEntity>? products;
  final String? messageError;

  ProductState({this.products, this.messageError});
}

final class ProductInitialState extends ProductState {}

final class ProductLoadingState extends ProductState {
  ProductLoadingState({super.products});
}

final class ProductLoadedState extends ProductState {
  ProductLoadedState({super.products});
}

final class ProductFailureState extends ProductState {
  ProductFailureState({super.messageError});
}

final class ProductConnectionFailureState extends ProductState {
  ProductConnectionFailureState({super.messageError});
}
