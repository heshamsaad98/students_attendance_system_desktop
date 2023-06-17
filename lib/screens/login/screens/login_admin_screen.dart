import 'package:flutter/material.dart';
import '../../../layout/screens/main_admin_screen.dart';
import '../../../shared/components/background.dart';
import '../../../shared/responsive.dart';
import '../components/login_form.dart';
import '../components/login_screen_top_image.dart';

class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

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
                  loginType: 'admin',
                  loginImage: 'assets/images/admin.jpg',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        loginNavToWidget: const MainAdminScreen(),
                        msgDesc:
                            'Please see the database manager for assistance.',
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
          loginType: 'admin',
          loginImage: 'assets/images/admin.jpg',
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                loginNavToWidget: const MainAdminScreen(),
                msgDesc: 'Please see the database manager for assistance.',
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
