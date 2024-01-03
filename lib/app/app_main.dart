import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/auth/welcome");
    return MaterialApp.router(
      title: "Food express",
      // theme: ThemeData(useMaterial3: true),
      routerConfig: Modular.routerConfig,
    );
  }
}
