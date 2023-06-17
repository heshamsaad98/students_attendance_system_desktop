import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:students_attendance_system_web/shared/components/custom_text_form.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_dropdown_button.dart';
import '../../../shared/components/custom_header_main_screens.dart';

class CustomHeader extends StatelessWidget {
  final Function()? functionCreateQR;
  final void Function(String?)? onChangedSemesterValue;
  final void Function(String?)? onChangedDepartmentValue;
  final void Function(String?)? onChangedCourseValue;
  final TextEditingController? lectureDateController;
  final String? Function(String?)? validateLectureDate;
  final String semesterValue;
  final List<String> semesterItems;
  final String departmentValue;
  final List<String> departmentItems;
  final String courseValue;
  final List<String> courseItems;

  const CustomHeader({
    Key? key,
    required this.functionCreateQR,
    required this.semesterValue,
    required this.semesterItems,
    required this.departmentValue,
    required this.departmentItems,
    required this.courseValue,
    required this.courseItems,
    required this.onChangedSemesterValue,
    required this.onChangedDepartmentValue,
    required this.onChangedCourseValue,
    required this.lectureDateController,
    required this.validateLectureDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const CustomHeaderMainScreens(
            title: 'Create presence',
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomDropdownButton(
                label: 'Course',
                dropdownValue: courseValue,
                items: courseItems,
                onChanged: onChangedCourseValue,
                prefix: Icons.book,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: CustomDropdownButton(
                label: 'Semester',
                dropdownValue: semesterValue,
                items: semesterItems,
                onChanged: onChangedSemesterValue,
                prefix: Icons.calendar_month_sharp,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: CustomDropdownButton(
                label: 'Department',
                dropdownValue: departmentValue,
                items: departmentItems,
                onChanged: onChangedDepartmentValue,
                prefix: Icons.location_city_outlined,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: CustomTextForm(
                controller: lectureDateController,
                validate: validateLectureDate,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    lectureDateController!.text =
                        DateFormat.yMMMd().format(value!);
                  });
                },
                label: 'Lecture date',
                type: TextInputType.datetime,
                prefix: Icons.calendar_month_outlined,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 17.0,
                  horizontal: 10.0,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CustomButton(
                function: functionCreateQR,
                text: 'Generate QR',
                height: 52.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
