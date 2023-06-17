import 'package:flutter/material.dart';
import '../../../shared/components/custom_text_title.dart';

class LoginScreenTopImage extends StatelessWidget {
  final String? loginType;
  final String? loginImage;
  const LoginScreenTopImage({
    Key? key,
    required this.loginType,
    required this.loginImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextTitle(
          title: loginType!.toUpperCase(),
          flex: 0,
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(
                loginImage!,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
