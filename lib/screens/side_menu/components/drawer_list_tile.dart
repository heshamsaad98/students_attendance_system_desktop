import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerListTile extends StatelessWidget {
  final String? title, icon;
  final Function()? onTap;
  final bool? selected;
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected! ? Colors.blue[50] : Colors.transparent,
      child: ListTile(
        onTap: onTap,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          icon!,
          height: 25.0,
          width: 25.0,
        ),
        title: Text(
          title!,
        ),
      ),
    );
  }
}
