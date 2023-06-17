import 'package:flutter/material.dart';
import '../../../shared/responsive.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: Responsive.isDesktop(context) ? 24 : 19,
        color: Colors.white,
        fontFamily: 'CustomHeaderFont',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
