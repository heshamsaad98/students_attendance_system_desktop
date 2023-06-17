import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_attendance_system_web/shared/cubit/states.dart';
import '../../screens/create_presence/create_presence_screen.dart';
import '../../screens/courses_management/courses_management_screen.dart';
import '../../screens/departments_management/departments_management_screen.dart';
import '../../screens/home/screens/home_admin_screen.dart';
import '../../screens/home/screens/home_instructor_screen.dart';
import '../../screens/instructors_management/instructors_management_screen.dart';
import '../../screens/lectures_management/lectures_management_screen.dart';
import '../../screens/reports/reports_screen.dart';
import '../../screens/semesters_management/semesters_management_screen.dart';
import '../../screens/students_management/students_management_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndexAdminScreen = 0;
  int currentIndexInstructorScreen = 0;

  List<Widget> screensAdmin = [
    const HomedAdminScreen(),
    StudentsManagementScreen(),
    InstructorsManagementScreen(),
    CoursesManagementScreen(),
    DepartmentsManagementScreen(),
    SemestersManagementScreen(),
    LecturesManagementScreen(),
    ReportsScreen(),
  ];

  List<Widget> screenInstructor = [
    const HomeInstructorScreen(),
    const CreatePresenceScreen(),
    ReportsScreen(),
  ];

  void changeDrawerAdmin(int index) {
    currentIndexAdminScreen = index;
    emit(AppChangeDrawerAdminState());
  }

  void changeDrawerInstructor(int index) {
    currentIndexInstructorScreen = index;
    emit(AppChangeDrawerInstructorState());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
