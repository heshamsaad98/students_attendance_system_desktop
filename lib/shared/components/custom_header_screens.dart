import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_header_main_screens.dart';

class CustomHeaderScreens extends StatelessWidget {
  final String? title;
  final void Function()? functionAddButton;
  final void Function()? functionEditButton;
  final void Function()? functionDeleteButton;

  const CustomHeaderScreens({
    Key? key,
    required this.title,
    required this.functionAddButton,
    required this.functionEditButton,
    required this.functionDeleteButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: CustomHeaderMainScreens(
              title: title,
            ),
          ),
          Expanded(
            child: CustomButton(
              function: functionAddButton,
              text: 'Add new',
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: CustomButton(
              function: functionEditButton,
              text: 'Edit',
              background: Colors.green,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: CustomButton(
              function: functionDeleteButton,
              text: 'Delete',
              background: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
