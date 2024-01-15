import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/core/core_module.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/repositories/i_auth_repository.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/services/i_api_services.dart';
import 'package:food_express_app/app/modules/auth/domain/usecases/login.dart';
import 'package:food_express_app/app/modules/auth/domain/usecases/register.dart';
import 'package:food_express_app/app/modules/auth/infra/repository/auth_repository.dart';
import 'package:food_express_app/app/modules/auth/infra/services/dio_services.dart';
import 'package:food_express_app/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'package:food_express_app/app/modules/auth/presenter/screens/auth/welcome_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(Injector i) {
    i.addSingleton<IApiServices>(DioServices.new);
    i.addSingleton<IAuthRepository>(AuthRepository.new);
    i.addSingleton<Login>(Login.new);
    i.addSingleton<Register>(Register.new);

    i.addSingleton<AuthController>(AuthController.new,
        config: BindConfig(
            onDispose: (authController) => authController.dispose()));
  }

//guards: [AuthGuard()];
  @override
  void routes(RouteManager r) {
    r.child("/welcome", child: (_) => const WelcomePage());
  }
}
