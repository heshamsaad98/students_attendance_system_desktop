import 'package:flutter/material.dart';
import '../../shared/components/custom_data_column.dart';
import '../../shared/components/custom_data_table.dart';
import '../../shared/responsive.dart';
import 'components/header.dart';
import 'components/reports_data_source.dart';
import 'components/reports_details.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const HeaderReports(),
          const SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: CustomDataTable(
                    columns: [
                      customDataColumn(
                        label: 'Student id',
                      ),
                      customDataColumn(
                        label: 'Student name',
                      ),
                      customDataColumn(
                        label: 'Attendance days',
                      ),
                      customDataColumn(
                        label: 'Absence days',
                      ),
                    ],
                    source: ReportsDataSource(context),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const Expanded(flex: 2, child: ReportsDetails())
              ],
            ),
          ),
          if (Responsive.isMobile(context)) const SizedBox(height: 20.0),
          if (Responsive.isMobile(context))
            const Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ReportsDetails(),
              ),
            ),
        ],
      ),
    );
  }
}
