import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:food_express_app/app/modules/product/domain/usecases/get_all_products.dart';
import 'package:food_express_app/app/modules/product/presenter/states/product_state.dart';

class ProductController extends ChangeNotifier {
  final GetAllProducts _getAllProducts;

  ProductController(this._getAllProducts);

  ProductState _state = ProductInitialState();

  ProductState get state => _state;

  Future<void> getAllProducts([int limits = 10]) async {
    _emit(ProductLoadingState());

    final isConnected = await checkConnectivity();

    if (!isConnected) {
      _emit(ProductConnectionFailureState(
          messageError: "O Dispositivo não está conectado na Internet."));
      return;
    }

    final (:products, :exception) = await _getAllProducts(limits);

    if (exception != null) {
      _emit(ProductFailureState(messageError: exception.messageError));
      return;
    }
    debugPrint("PRODUCTS: $products");
    _emit(ProductLoadedState(products: products));
  }

  Future<bool> checkConnectivity() async {
    final connectivity = await (Connectivity().checkConnectivity());

    if (connectivity == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  void _emit(ProductState newState) {
    _state = newState;
    notifyListeners();
  }
}
