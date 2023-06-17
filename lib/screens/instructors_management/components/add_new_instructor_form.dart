import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:intl/intl.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_dropdown_button.dart';
import '../../../shared/components/custom_gender_selected.dart';
import '../../../shared/components/custom_text_form.dart';
import '../../../shared/components/navigate_and_finish.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class AddNewInstructorForm extends StatelessWidget {
  AddNewInstructorForm({Key? key}) : super(key: key);

  final TextEditingController? firstnameController = TextEditingController();
  final TextEditingController? lastnameController = TextEditingController();
  final TextEditingController? birthdateController = TextEditingController();
  final TextEditingController? usernameController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? addressController = TextEditingController();
  final TextEditingController? academicDegreeController =
      TextEditingController();
  final instructorFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Form(
        key: instructorFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextForm(
                    controller: firstnameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'first name must not be empty';
                      }
                      return null;
                    },
                    label: 'First Name',
                    type: TextInputType.text,
                    prefix: Icons.person,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextForm(
                    controller: lastnameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'last name must not be empty';
                      }
                      return null;
                    },
                    label: 'Last Name',
                    type: TextInputType.text,
                    prefix: Icons.person,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GenderSelect(
                    onChanged: (Gender? gender) {},
                  ),
                ),
              ],
            ),
            CustomTextForm(
              controller: birthdateController,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'birth date must not be empty';
                }
                return null;
              },
              label: 'Birth date',
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                ).then((value) {
                  birthdateController!.text = DateFormat.yMMMd().format(value!);
                });
              },
              type: TextInputType.datetime,
              prefix: Icons.calendar_month_sharp,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextForm(
                    controller: usernameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'username must not be empty';
                      }
                      return null;
                    },
                    label: 'Username',
                    type: TextInputType.text,
                    prefix: Icons.person,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextForm(
                    controller: passwordController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password name must not be empty';
                      }
                      return null;
                    },
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    suffix: AppCubit.get(context).suffix,
                    isPassword: AppCubit.get(context).isPassword,
                    suffixPressed: () {
                      AppCubit.get(context).changePasswordVisibility();
                    },
                    prefix: Icons.key,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextForm(
              controller: addressController,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'address name must not be empty';
                }
                return null;
              },
              onTap: () {
                showCountryPicker(
                  context: context,
                  searchAutofocus: true,
                  onSelect: (Country country) {
                    addressController!.text = country.displayNameNoCountryCode;
                  },
                );
              },
              label: 'Address',
              type: TextInputType.streetAddress,
              prefix: Icons.location_city_outlined,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextForm(
              controller: academicDegreeController,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'academic degree must not be empty';
                }
                return null;
              },
              label: 'Academic degree',
              type: TextInputType.text,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomDropdownButton(
              label: 'Department',
              dropdownValue: 'Information System',
              items: const [
                'Information System',
                'Computer Since',
              ],
              onChanged: (String? newValue) {},
              prefix: Icons.location_city_outlined,
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
                      if (instructorFormKey.currentState!.validate()) {
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
      ),
    );
  }
}
