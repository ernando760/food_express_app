import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/app_main.dart';
import 'package:food_express_app/app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

  runApp(ModularApp(module: AppModule(), child: const AppMain()));
}
