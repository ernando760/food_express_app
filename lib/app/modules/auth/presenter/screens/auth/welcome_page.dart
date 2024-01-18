import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:food_express_app/app/modules/auth/presenter/screens/widgets/auth_form_widget.dart';
import 'package:food_express_app/app/modules/auth/presenter/states/auth_state.dart';
import 'package:food_express_app/app/modules/product/presenter/screens/product_page.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    return Scaffold(
      backgroundColor: iceWhite,
      body: AnimatedBuilder(
          animation: authController,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                authController.state is LoadedAuthState
                    ? authController.state.user == null
                        ? const AuthFormWidget()
                        : const ProductPage()
                    : const AuthFormWidget(),
                if (authController.state is LoadingAuthState)
                  Container(
                    decoration: BoxDecoration(color: black.withOpacity(.5)),
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: red,
                    )),
                  ),
              ],
            );
          }),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME PAGE"),
        actions: [
          IconButton(
              onPressed: () async {
                await Modular.get<AuthController>().signOut();
                // Modular.to.navigate("/auth/welcome");
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text(
            Modular.get<AuthController>().state.user?.toJson() ?? "Home page"),
      ),
    );
  }
}
