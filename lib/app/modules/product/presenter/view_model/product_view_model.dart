import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/product/domain/usecases/get_all_products.dart';
import 'package:food_express_app/app/modules/product/presenter/states/product_state.dart';
import 'dart:math' as math;

import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class ProductViewModel extends ChangeNotifier {
  final GetAllProducts _getAllProducts;

  ProductViewModel(this._getAllProducts);

  ProductState _state = ProductInitialState();

  ProductState get state => _state;

  final ValueNotifier<int> amount = ValueNotifier<int>(1);
  bool showMore = false;

  String get textShowMore => showMore ? "Mostrar menos" : "Mostar mais";
  double priceTotal(double price) {
    return amount.value * price;
  }

  void incrementAmount() => amount.value++;
  void decrementAmount() =>
      amount.value <= 1 ? amount.value = 1 : amount.value--;

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

  bool _checkRatingIsDecimal(double rating) {
    final ratingString = rating.toString();
    return ratingString.contains(".") && !ratingString.contains(".0");
  }

  List<Icon> startProductBuilder(double rating, {double? size}) {
    const starsTotal = 5;
    final fullStar = math.min(rating, starsTotal).toInt();
    final isDecimal = _checkRatingIsDecimal(rating);

    int starHalf = isDecimal ? 1 : 0;

    final emptyStar = math.max(starsTotal - rating, 0).toInt();

    final stars = List.filled(
            fullStar, Icon(Icons.star_outlined, color: yellow, size: size)) +
        List.filled(starHalf,
            Icon(Icons.star_half_outlined, color: yellow, size: size)) +
        List.filled(
            emptyStar, Icon(Icons.star_outline, color: yellow, size: size));
    return stars;
  }

  void setShowMore() {
    showMore = !showMore;
    notifyListeners();
  }
}
