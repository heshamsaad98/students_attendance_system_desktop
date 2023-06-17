import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_dropdown_button.dart';
import '../../../shared/components/custom_text_form.dart';
import '../../../shared/components/navigate_and_finish.dart';

class AddNewCourseForm extends StatelessWidget {
  AddNewCourseForm({Key? key}) : super(key: key);
  final courseFormKey = GlobalKey<FormState>();

  final TextEditingController? courseNameController = TextEditingController();
  final TextEditingController? courseCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: courseFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextForm(
                  controller: courseNameController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'named must not be empty';
                    }
                    return null;
                  },
                  label: 'Course Name',
                  type: TextInputType.text,
                  prefix: Icons.book,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextForm(
                  controller: courseCodeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'course code must not be empty';
                    }
                    return null;
                  },
                  label: 'Course Code',
                  type: TextInputType.text,
                  prefix: Icons.numbers,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomDropdownButton(
            label: 'Department',
            dropdownValue: 'Information System',
            items: const [
              'Information System',
              'Computer Science',
              'Arabic Accounting',
              'English Accounting',
            ],
            onChanged: (String? newValue) {},
            prefix: Icons.location_city_outlined,
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomDropdownButton(
            label: 'Instructor',
            dropdownValue: 'Dr/Mohamed Ali',
            items: const [
              'Dr/Mohamed Ali',
              'Dr/Ahmed Mahmoud',
            ],
            onChanged: (String? newValue) {},
            prefix: Icons.person,
          ),
          const SizedBox(
            height: 60.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: CustomButton(
                  function: () {
                    if (courseFormKey.currentState!.validate()) {
                      customAwesomeDialog(
                        context: context,
                        title: 'Success',
                        desc: 'Added successfully',
                      );
                      Timer(const Duration(seconds: 4), () {
                        navigateAndFinish(context, const MainAdminScreen());
                      });
                    }
                  },
                  text: 'Save',
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomButton(
                  function: () {
                    customAwesomeDialog(
                      context: context,
                      dialogType: DialogType.QUESTION,
                      title: 'Cancel',
                      desc: 'Do you really want to cancel?',
                      btnOkText: 'Yes',
                      btnOkOnPress: () {
                        navigateAndFinish(
                          context,
                          const MainAdminScreen(),
                        );
                      },
                      btnCancelText: 'No',
                      btnCancelOnPress: () {},
                    );
                  },
                  text: 'Cancel',
                  background: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
