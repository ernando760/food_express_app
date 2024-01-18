import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/auth_module.dart';
import 'package:food_express_app/app/modules/product/domain/infra/i_product_repository.dart';
import 'package:food_express_app/app/modules/product/domain/usecases/get_all_products.dart';
import 'package:food_express_app/app/modules/product/infra/product_repository.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';
import 'package:food_express_app/app/modules/product/presenter/screens/product_detail_page.dart';
import 'package:food_express_app/app/modules/product/presenter/screens/product_page.dart';

class ProductModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton<IProductRepository>(ProductRepository.new);
    i.addSingleton<GetAllProducts>(GetAllProducts.new);
    i.addSingleton(ProductViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const ProductPage());
    r.child("/product",
        child: (_) => ProductDetailPage(product: Modular.args.data));
  }
}
