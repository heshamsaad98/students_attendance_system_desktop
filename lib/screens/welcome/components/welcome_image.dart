import 'package:flutter/material.dart';
import '../../../shared/components/custom_text_title.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextTitle(
          title:
              'welcome to students attendance management system'.toUpperCase(),
          flex: 0,
          fontSize: 18.0,
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(
                "assets/images/welcome.png",
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
