import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_attendance_system_web/shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/navigate_to.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import 'custom_login_text_form.dart';

class LoginForm extends StatelessWidget {
  final Widget loginNavToWidget;
  final String msgDesc;

  LoginForm({
    Key? key,
    required this.loginNavToWidget,
    required this.msgDesc,
  }) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Form(
        key: loginFormKey,
        child: Column(
          children: [
            CustomLoginTextForm(
              controller: usernameController,
              hintText: 'username',
              type: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.person,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'please enter your username';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CustomLoginTextForm(
                controller: passwordController,
                hintText: 'password',
                type: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.key,
                suffixIcon: AppCubit.get(context).suffix,
                isPassword: AppCubit.get(context).isPassword,
                suffixPressed: () {
                  AppCubit.get(context).changePasswordVisibility();
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (loginFormKey.currentState!.validate()) {
                  navigateTo(
                    context,
                    loginNavToWidget,
                  );
                }
              },
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextButton(
              onPressed: () {
                customAwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  title: 'Warning',
                  desc: msgDesc,
                  showCloseIcon: true,
                );
              },
              child: const Text(
                'Forgot Password?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
