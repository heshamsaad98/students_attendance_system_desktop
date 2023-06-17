import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/responsive.dart';
import 'custom_card_shape_painter.dart';
import 'custom_text.dart';

class CustomHomeCard extends StatelessWidget {
  final Color? startColor, endColor;
  final String? nameData, icon;
  final String? numOfData;
  final Function()? onTap;

  const CustomHomeCard({
    Key? key,
    this.startColor = Colors.white,
    this.endColor = Colors.white,
    required this.icon,
    required this.nameData,
    this.numOfData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              height: Responsive.isDesktop(context) ? 200 : 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    startColor!,
                    endColor!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: endColor!,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: CustomPaint(
                size: const Size(100, 150),
                painter: CustomCardShapePainter(
                  24.0,
                  endColor!,
                  endColor!,
                ),
              ),
            ),
            SizedBox(
              height: Responsive.isDesktop(context) ? 200 : 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: SvgPicture.asset(
                          icon!,
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: nameData!,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  if (numOfData != null)
                    CustomText(
                      text: numOfData!,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
