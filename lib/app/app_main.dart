import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Food express",
      routerConfig: Modular.routerConfig,
    );
  }
}
