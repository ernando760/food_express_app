import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/core/core_module.dart';
import 'package:food_express_app/app/modules/auth/auth_module.dart';
import 'package:food_express_app/app/modules/product/product_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule(), ProductModule(), CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module("/auth", module: AuthModule());
    r.module("/product", module: ProductModule());
  }
}
