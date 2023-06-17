import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String? title;
  final int flex;
  final double? fontSize;

  const CustomTextTitle({
    Key? key,
    required this.title,
    this.flex = 1,
    this.fontSize = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color(0xff6DC8F3),
              Color(0xff73A1F9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: Text(
          title!,
          maxLines: 1,
          style: TextStyle(
            fontFamily: 'CustomHeaderFont',
            fontSize: fontSize,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
