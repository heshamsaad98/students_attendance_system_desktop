import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_form.dart';
import '../../../shared/components/navigate_and_finish.dart';

class AddNewSemesterForm extends StatelessWidget {
  AddNewSemesterForm({Key? key}) : super(key: key);

  final TextEditingController? semesterNameController = TextEditingController();
  final semesterFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: semesterFormKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: semesterNameController,
            validate: (value) {
              if (value!.isEmpty) {
                return 'semester name must not be empty';
              }
              return null;
            },
            label: 'Semester Name',
            type: TextInputType.text,
            textInputAction: TextInputAction.done,
            prefix: Icons.calendar_month_sharp,
          ),
          const SizedBox(
            height: 100.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: CustomButton(
                  function: () {
                    if (semesterFormKey.currentState!.validate()) {
                      customAwesomeDialog(
                        context: context,
                        title: 'Success',
                        desc: 'Added successfully',
                      );
                      Timer(const Duration(seconds: 4), () {
                        navigateAndFinish(
                          context,
                          const MainAdminScreen(),
                        );
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
