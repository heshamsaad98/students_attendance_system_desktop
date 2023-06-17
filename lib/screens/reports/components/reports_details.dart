import 'package:flutter/material.dart';
import 'chart.dart';
import 'reports_info_card.dart';

class ReportsDetails extends StatelessWidget {
  const ReportsDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Attendance Details",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Chart(),
          SizedBox(
            height: 20.0,
          ),
          ReportsInfoCard(
            title: "Attendance",
            rate: '75%',
            textColor: Colors.blue,
          ),
          SizedBox(
            height: 10.0,
          ),
          ReportsInfoCard(
            title: "Absence",
            rate: '25%',
            textColor: Colors.red,
            dataColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
