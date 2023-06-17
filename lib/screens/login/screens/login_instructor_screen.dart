import 'package:flutter/material.dart';
import '../../../layout/screens/main_instructor_screen.dart';
import '../../../shared/components/background.dart';
import '../../../shared/responsive.dart';
import '../components/login_form.dart';
import '../components/login_screen_top_image.dart';

class LoginInstructorScreen extends StatelessWidget {
  const LoginInstructorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(
                  loginType: 'instructor',
                  loginImage: 'assets/images/instructor.jpg',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        loginNavToWidget: const MainInstructorScreen(),
                        msgDesc:
                            'Please see the administration for assistance.',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(
          loginType: 'instructor',
          loginImage: 'assets/images/instructor.jpg',
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                loginNavToWidget: const MainInstructorScreen(),
                msgDesc: 'Please see the administration for assistance.',
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
