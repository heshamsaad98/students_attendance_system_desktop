import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? dropdownValue;
  final void Function(String?)? onChanged;
  final IconData? prefix;

  const CustomDropdownButton({
    Key? key,
    this.label,
    required this.items,
    this.dropdownValue,
    required this.onChanged,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
      ),
      value: dropdownValue,
      onChanged: onChanged,
      isExpanded: true,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
