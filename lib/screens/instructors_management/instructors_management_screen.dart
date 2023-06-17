import 'package:flutter/material.dart';
import '../../shared/components/custom_data_column.dart';
import '../../shared/components/custom_header_screens.dart';
import '../../shared/components/custom_text_form.dart';
import '../../shared/components/custom_data_table.dart';
import '../../shared/components/navigate_to.dart';
import 'components/add_new_instructor.dart';
import 'components/instructors_data_source.dart';

class InstructorsManagementScreen extends StatelessWidget {
  InstructorsManagementScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomHeaderScreens(
            title: 'Instructors Management',
            functionAddButton: () {
              navigateTo(context, const AddNewInstructor());
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
                    columns: [
                      customDataColumn(
                        label: 'Instructor id',
                      ),
                      customDataColumn(
                        label: 'Instructor name',
                      ),
                      customDataColumn(
                        label: 'Department',
                      ),
                      customDataColumn(
                        label: 'Gender',
                      ),
                      customDataColumn(
                        label: 'Birth date',
                      ),
                      customDataColumn(
                        label: 'Academic degree',
                      ),
                    ],
                    source: InstructorsDataSource(context),
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
