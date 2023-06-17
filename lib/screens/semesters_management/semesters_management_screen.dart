import 'package:flutter/material.dart';
import '../../shared/components/custom_data_column.dart';
import '../../shared/components/custom_header_screens.dart';
import '../../shared/components/custom_text_form.dart';
import '../../shared/components/custom_data_table.dart';
import '../../shared/components/navigate_to.dart';
import 'components/add_new_semester.dart';
import 'components/semester_data_source.dart';

class SemestersManagementScreen extends StatelessWidget {
  SemestersManagementScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomHeaderScreens(
            title: 'Semesters Management',
            functionAddButton: () {
              navigateTo(context, const AddNewSemester());
            },
            functionEditButton: () {},
            functionDeleteButton: () {},
          ),
          const SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: Column(
              children: [
                CustomTextForm(
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value) {},
                  hint: 'Search for a student',
                  prefix: Icons.search,
                  textInputAction: TextInputAction.search,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Expanded(
                  child: CustomDataTable(
                    rowsPerPage: 2,
                    columns: [
                      customDataColumn(
                        label: 'Semester id',
                      ),
                      customDataColumn(
                        label: 'Semester',
                      ),
                    ],
                    source: SemestersDataSource(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
