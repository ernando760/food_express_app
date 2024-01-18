import 'package:flutter/material.dart';

import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, this.leading})
      : super(key: key);
  final String title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: red,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: white),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
