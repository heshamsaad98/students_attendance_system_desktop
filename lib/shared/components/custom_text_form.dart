import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final void Function()? onTap;
  final bool? isPassword;
  final String? Function(String?)? validate;
  final String? label;
  final IconData? prefix;
  final IconData? suffix;
  final TextInputAction? textInputAction;
  final void Function()? suffixPressed;
  final String? hint;
  final Color? cursorColor;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextForm({
    Key? key,
    this.hint,
    required this.controller,
    required this.type,
    this.onTap,
    this.isPassword = false,
    this.validate,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.cursorColor,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 10.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      textInputAction: textInputAction,
      cursorColor: cursorColor,
      obscureText: isPassword!,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hint,
        labelText: label,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        contentPadding: contentPadding,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
