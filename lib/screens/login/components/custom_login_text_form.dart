import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

class CustomLoginTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Color? cursorColor;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixPressed;
  final bool isPassword;
  final TextInputType? type;
  final String? Function(String?)? validate;

  const CustomLoginTextForm({
    Key? key,
    required this.controller,
    this.textInputAction,
    this.cursorColor = defaultColor,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    required this.type,
    required this.validate,
    this.suffixIcon,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: type,
      obscureText: isPassword,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        hintText: hintText!,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            prefixIcon,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                ),
                child: IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                  ),
                ),
              )
            : null,
      ),
      validator: validate,
    );
  }
}
