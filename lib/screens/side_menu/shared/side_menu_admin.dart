import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/navigate_and_finish.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../../Welcome/welcome_screen.dart';
import '../components/drawer_list_tile.dart';

class SideMenuAdmin extends StatelessWidget {
  const SideMenuAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/images/qr_code.png',
                ),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 0 ? true : false,
                title: 'Home',
                icon: 'assets/icons/home.svg',
                onTap: () => cubit.changeDrawerAdmin(0),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 1 ? true : false,
                title: 'Students',
                icon: 'assets/icons/student.svg',
                onTap: () => cubit.changeDrawerAdmin(1),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 2 ? true : false,
                title: 'Instructors',
                icon: 'assets/icons/instructor.svg',
                onTap: () => cubit.changeDrawerAdmin(2),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 3 ? true : false,
                title: 'Courses',
                icon: 'assets/icons/courses.svg',
                onTap: () => cubit.changeDrawerAdmin(3),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 4 ? true : false,
                title: 'Departments',
                icon: 'assets/icons/department.svg',
                onTap: () => cubit.changeDrawerAdmin(4),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 5 ? true : false,
                title: 'Semesters',
                icon: 'assets/icons/semester.svg',
                onTap: () => cubit.changeDrawerAdmin(5),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 6 ? true : false,
                title: 'Lectures',
                icon: 'assets/icons/lectures.svg',
                onTap: () => cubit.changeDrawerAdmin(6),
              ),
              DrawerListTile(
                selected: cubit.currentIndexAdminScreen == 7 ? true : false,
                title: 'Reports',
                icon: 'assets/icons/report.svg',
                onTap: () => cubit.changeDrawerAdmin(7),
              ),
              DrawerListTile(
                selected: false,
                title: 'Logout',
                icon: 'assets/icons/logout.svg',
                onTap: () {
                  customAwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    title: 'Logout',
                    desc: 'Do you want to logout already?',
                    btnOkText: 'Yes',
                    btnOkOnPress: () {
                      navigateAndFinish(
                        context,
                        const WelcomeScreen(),
                      );
                    },
                    btnCancelText: 'No',
                    btnCancelOnPress: () {},
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
