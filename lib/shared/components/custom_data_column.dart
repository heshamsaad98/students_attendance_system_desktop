import 'package:flutter/material.dart';

dynamic customDataColumn({required String label}) {
  return DataColumn(
      label: Text(
    label,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ));
}
