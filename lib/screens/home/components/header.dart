import 'package:flutter/material.dart';
import '../../../shared/components/custom_header_main_screens.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeaderMainScreens(
      title:
          'Welcome to student attendance system using QR code.'.toUpperCase(),
    );
  }
}
