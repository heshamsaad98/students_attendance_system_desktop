import 'package:flutter/material.dart';
import '../../../shared/components/navigate_to.dart';
import '../../login/screens/login_admin_screen.dart';
import '../../login/screens/login_instructor_screen.dart';

class LoginAdminAndInstructorButton extends StatelessWidget {
  const LoginAdminAndInstructorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            navigateTo(context, const LoginAdminScreen());
          },
          child: Text(
            "Admin".toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            navigateTo(context, const LoginInstructorScreen());
          },
          child: Text(
            "Instructor".toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
