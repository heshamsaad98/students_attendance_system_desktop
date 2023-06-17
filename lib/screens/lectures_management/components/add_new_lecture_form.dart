import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_dropdown_button.dart';
import '../../../shared/components/custom_text_form.dart';
import '../../../shared/components/navigate_and_finish.dart';

class AddNewLectureForm extends StatelessWidget {
  AddNewLectureForm({Key? key}) : super(key: key);

  final TextEditingController? endTimeController = TextEditingController();
  final TextEditingController? startTimeController = TextEditingController();
  final lectureFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: lectureFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextForm(
                  controller: startTimeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'lecture start time must not be empty';
                    }
                    return null;
                  },
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      startTimeController!.text =
                          value!.format(context).toString();
                    });
                  },
                  label: 'Start',
                  type: TextInputType.datetime,
                  prefix: Icons.timelapse,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextForm(
                  controller: endTimeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'lecture end time must not be empty';
                    }
                    return null;
                  },
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      endTimeController!.text =
                          value!.format(context).toString();
                    });
                  },
                  label: 'End',
                  type: TextInputType.datetime,
                  prefix: Icons.timelapse,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          CustomDropdownButton(
            label: 'Course',
            dropdownValue: 'Programming',
            items: const [
              'Programming',
              'Network',
              'Systems Analysis',
              'Money and Banks',
              'Data Security',
              'Accounting',
              'Feasibility Study',
              'Medical Systems',
              'Reports Preparation',
              'Marketing',
              'Database',
              'Operations Research',
            ],
            onChanged: (String? newValue) {},
            prefix: Icons.book,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomDropdownButton(
            label: 'Department',
            dropdownValue: 'Information System',
            items: const [
              'Information System',
              'Computer Science',
              'Arabic Accounting',
              'English Accounting',
              'Arabic Administration',
              'English Administration',
            ],
            onChanged: (String? newValue) {},
            prefix: Icons.location_city_outlined,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomDropdownButton(
            label: 'Semester',
            dropdownValue: 'First term',
            items: const [
              'First term',
              'Second term',
            ],
            onChanged: (String? newValue) {},
            prefix: Icons.calendar_today_outlined,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomDropdownButton(
            label: 'Instructor',
            dropdownValue: 'Dr/Mohamed',
            items: const [
              'Dr/Mohamed',
              'Dr/Ahmed',
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
                    if (lectureFormKey.currentState!.validate()) {
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
