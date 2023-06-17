import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 50,
          startDegreeOffset: -90,
          sections: paiChartSelectionData,
        ),
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: Colors.blue,
    value: 20,
    showTitle: false,
    radius: 33,
  ),
  PieChartSectionData(
    color: Colors.red,
    value: 10,
    showTitle: false,
    radius: 30,
  ),
];
