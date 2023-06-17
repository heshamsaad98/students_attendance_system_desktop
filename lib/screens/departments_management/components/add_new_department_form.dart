import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_form.dart';
import '../../../shared/components/navigate_and_finish.dart';

class AddNewDepartmentForm extends StatelessWidget {
  AddNewDepartmentForm({Key? key}) : super(key: key);

  final TextEditingController? departmentNameController =
      TextEditingController();
  final departmentFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: departmentFormKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: departmentNameController,
            validate: (value) {
              if (value!.isEmpty) {
                return 'department name must not be empty';
              }
              return null;
            },
            label: 'Department Name',
            type: TextInputType.text,
            textInputAction: TextInputAction.done,
            prefix: Icons.location_city_outlined,
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
                    if (departmentFormKey.currentState!.validate()) {
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
