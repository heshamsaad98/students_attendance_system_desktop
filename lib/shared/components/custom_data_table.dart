import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final DataTableSource source;
  final int rowsPerPage;
  final Widget? header;

  const CustomDataTable({
    Key? key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 9,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PaginatedDataTable(
          rowsPerPage: rowsPerPage,
          columns: columns,
          source: source,
          header: header,
        ),
      ],
    );
  }
}
