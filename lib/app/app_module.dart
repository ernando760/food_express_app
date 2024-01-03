import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/auth_module.dart';
import 'package:food_express_app/app/modules/auth/presenter/screens/auth/welcome_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
    r.module("/auth", module: AuthModule());
  }
}
