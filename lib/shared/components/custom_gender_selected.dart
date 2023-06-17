import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class GenderSelect extends StatelessWidget {
  final void Function(Gender?)? onChanged;
  final bool verticalAlignedText;
  final bool equallyAligned;
  final bool isCircular;

  const GenderSelect({
    Key? key,
    this.verticalAlignedText = true,
    this.equallyAligned = true,
    this.isCircular = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenderPickerWithImage(
      verticalAlignedText: verticalAlignedText,
      selectedGender: Gender.Male,
      selectedGenderTextStyle: const TextStyle(
        color: Color(0xFF8b32a8),
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unSelectedGenderTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      onChanged: onChanged,
      equallyAligned: equallyAligned,
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      isCircular: isCircular,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 50, //default : 40
    );
  }
}
