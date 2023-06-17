import 'package:flutter/material.dart';
import 'package:students_attendance_system_web/shared/components/navigate_to.dart';
import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_dropdown_button.dart';
import '../../../shared/components/custom_header_main_screens.dart';
import '../../pdf_preview/pdf_preview_screen.dart';

class HeaderReports extends StatefulWidget {
  const HeaderReports({Key? key}) : super(key: key);

  @override
  State<HeaderReports> createState() => _HeaderReportsState();
}

class _HeaderReportsState extends State<HeaderReports> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 7,
                child: CustomHeaderMainScreens(
                  title: 'Reports',
                ),
              ),
              Expanded(
                child: CustomButton(
                  function: () {
                    navigateTo(
                      context,
                      const PdfPreviewPage(),
                    );
                  },
                  text: 'Create pdf',
                  background: Colors.red,
                  icon: Icons.picture_as_pdf,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton(
                label: 'Course',
                dropdownValue: 'Database',
                items: const [
                  'Database',
                  'Operations Research',
                  'Marketing',
                  'Reports Preparation',
                  'Medical Systems',
                  'Feasibility Study',
                  'Accounting',
                  'Data Security',
                  'Money and Banks',
                  'Systems Analysis',
                  'Programming',
                  'Network',
                ],
                onChanged: (String? newValue) {},
                prefix: Icons.book,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CustomDropdownButton(
                label: 'Semester',
                dropdownValue: 'First term',
                items: const [
                  'First term',
                  'Second term',
                ],
                onChanged: (String? newValue) {},
                prefix: Icons.calendar_month_sharp,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CustomDropdownButton(
                label: 'Department',
                dropdownValue: 'Information System',
                items: const [
                  'Information System',
                  'Computer Science',
                  'Arabic Accounting',
                  'English Accounting',
                  'Arabic Administration',
                  'English Administration',
                ],
                onChanged: (String? newValue) {},
                prefix: Icons.location_city,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
