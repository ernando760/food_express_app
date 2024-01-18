import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';
import 'package:food_express_app/app/modules/product/presenter/states/product_state.dart';

class ProductStateBuilder extends StatefulWidget {
  const ProductStateBuilder(
      {super.key,
      required this.loading,
      required this.loaded,
      required this.failure,
      this.onInit});
  final Function? onInit;
  final Widget Function() loading;

  final Widget Function(List<ProductEntity>? product) loaded;
  final Widget Function(String? messageError, bool isConnectionError) failure;
  @override
  State<ProductStateBuilder> createState() => _ProductStateBuilderState();
}

class _ProductStateBuilderState extends State<ProductStateBuilder> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      widget.onInit!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductViewModel>();
    return switch (controller.state) {
      ProductInitialState() || ProductLoadingState() => widget.loading(),
      ProductLoadedState() => widget.loaded(controller.state.products),
      ProductFailureState() ||
      ProductConnectionFailureState() =>
        widget.failure(controller.state.messageError,
            controller.state is ProductConnectionFailureState ? true : false),
    };
  }
}
