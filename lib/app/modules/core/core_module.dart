import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/core/local/i_local_storage.dart';
import 'local/shared_preferences_local_storage.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ILocalStorage>(SharedPreferencesLocalStorage.new);
  }
}
