import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'components/header.dart';

class CreatePresenceScreen extends StatefulWidget {
  const CreatePresenceScreen({Key? key}) : super(key: key);

  @override
  State<CreatePresenceScreen> createState() => _CreatePresenceScreenState();
}

class _CreatePresenceScreenState extends State<CreatePresenceScreen> {
  String semesterValue = 'First term';
  String departmentValue = 'Information System';
  String courseValue = 'Programming';
  List<String> semesterItems = [
    'First term',
    'Second term',
  ];
  List<String> departmentItems = [
    'Information System',
    'Computer Science',
    'Arabic Accounting',
    'English Accounting',
    'Arabic Administration',
    'English Administration',
  ];
  List<String> courseItems = [
    'Programming',
    'Operations Research',
    'Database',
    'Marketing',
    'Reports Preparation',
    'Medical Systems',
    'Feasibility Study',
    'Accounting',
    'Data Security',
    'Money and Banks',
    'Systems Analysis',
    'Network',
  ];
  String? dataQRCode;
  TextEditingController? lectureDateController = TextEditingController();
  final createPresenceFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: createPresenceFormKey,
        child: Column(
          children: [
            CustomHeader(
              functionCreateQR: () {
                if (createPresenceFormKey.currentState!.validate()) {
                  setState(() {
                    String systemToken = 'sas';
                    String tokenQr = randomString(50) +
                        departmentValue.toLowerCase() +
                        randomString(50) +
                        courseValue.toLowerCase() +
                        randomString(50) +
                        semesterValue.toLowerCase() +
                        randomString(50) +
                        lectureDateController!.text +
                        systemToken;
                    dataQRCode = tokenQr;
                  });
                }
              },
              semesterValue: semesterValue,
              semesterItems: semesterItems,
              departmentValue: departmentValue,
              departmentItems: departmentItems,
              courseValue: courseValue,
              courseItems: courseItems,
              onChangedSemesterValue: (String? newValue) {
                setState(() {
                  semesterValue = newValue!;
                });
              },
              onChangedDepartmentValue: (String? newValue) {
                departmentValue = newValue!;
              },
              onChangedCourseValue: (String? newValue) {
                courseValue = newValue!;
              },
              lectureDateController: lectureDateController,
              validateLectureDate: (value) {
              if (value!.isEmpty) {
                return 'lecture date must not be empty';
              }
              return null;
            },
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (dataQRCode != null)
                        QrImage(
                          data: dataQRCode!,
                          size: 300,
                          embeddedImage:
                              const AssetImage('assets/images/logo.png'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: const Size(80, 80),
                          ),
                        ),
                      if (dataQRCode == null)
                        Column(
                          children: [
                            const Text(
                              'create presence',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            LoadingAnimationWidget.staggeredDotsWave(
                              color: const Color(0xff73A1F9),
                              size: 100,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
