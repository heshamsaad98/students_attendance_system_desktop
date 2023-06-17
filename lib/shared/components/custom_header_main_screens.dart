import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../responsive.dart';
import '../../layout/components/menu_app_controller.dart';
import 'custom_text_title.dart';

class CustomHeaderMainScreens extends StatelessWidget {
  final String? title;

  const CustomHeaderMainScreens({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        CustomTextTitle(title: title),
      ],
    );
  }
}
