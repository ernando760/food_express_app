import 'package:flutter/widgets.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/controllers/product_controller.dart';
import 'package:food_express_app/app/modules/product/presenter/states/product_state.dart';

class GetAllProductsBuilder extends StatefulWidget {
  const GetAllProductsBuilder(
      {super.key,
      required this.loading,
      required this.loaded,
      required this.failure,
      required this.controller});
  final ProductController controller;
  final Widget Function() loading;
  final Widget Function(List<ProductEntity>? product) loaded;
  final Widget Function(String? messageError, bool isConnectionError) failure;
  @override
  State<GetAllProductsBuilder> createState() => _GetAllProductsBuilderState();
}

class _GetAllProductsBuilderState extends State<GetAllProductsBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) async => await widget.controller.getAllProducts());
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.controller.state;
    return switch (state) {
      ProductInitialState() || ProductLoadingState() => widget.loading(),
      ProductLoadedState() => widget.loaded(state.products),
      ProductFailureState() ||
      ProductConnectionFailureState() =>
        widget.failure(state.messageError,
            state is ProductConnectionFailureState ? true : false),
    };
  }
}
