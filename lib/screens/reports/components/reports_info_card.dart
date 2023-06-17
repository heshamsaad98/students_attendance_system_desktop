import 'package:flutter/material.dart';

class ReportsInfoCard extends StatelessWidget {
  final String title, rate;
  final Color? textColor;
  final Color? dataColor;

  const ReportsInfoCard({
    Key? key,
    required this.title,
    required this.rate,
    this.textColor = Colors.black,
    this.dataColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: dataColor!,
            radius: 8.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            rate,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor!),
          ),
        ],
      ),
    );
  }
}
