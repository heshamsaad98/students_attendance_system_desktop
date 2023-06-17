import 'package:flutter/material.dart';
import '../../../shared/components/custom_text_title.dart';
import 'add_new_lecture_form.dart';

class AddNewLecture extends StatelessWidget {
  const AddNewLecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextTitle(
                    title: 'Add Lecture',
                    flex: 0,
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  AddNewLectureForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
