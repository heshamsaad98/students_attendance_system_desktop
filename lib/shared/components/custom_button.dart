import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final void Function()? function;
  final String? text;
  final IconData? icon;
  final Color? iconColor;

  const CustomButton({
    Key? key,
    this.width = double.infinity,
    this.height = 40.0,
    this.background = Colors.blue,
    this.isUpperCase = true,
    this.radius = 10.0,
    required this.function,
    required this.text,
    this.icon,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
              ),
            if (icon != null)
              const SizedBox(
                width: 4.0,
              ),
            Text(
              isUpperCase ? text!.toUpperCase() : text!,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
