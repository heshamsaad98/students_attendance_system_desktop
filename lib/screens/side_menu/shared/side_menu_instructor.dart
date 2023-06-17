import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/custom_awesome_dialog.dart';
import '../../../shared/components/navigate_and_finish.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../../Welcome/welcome_screen.dart';
import '../components/drawer_list_tile.dart';

class SideMenuInstructor extends StatelessWidget {
  const SideMenuInstructor({Key? key}) : super(key: key);

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
                selected:
                    cubit.currentIndexInstructorScreen == 0 ? true : false,
                title: 'Home',
                icon: 'assets/icons/home.svg',
                onTap: () => cubit.changeDrawerInstructor(0),
              ),
              DrawerListTile(
                selected:
                    cubit.currentIndexInstructorScreen == 1 ? true : false,
                title: 'Create presence',
                icon: 'assets/icons/generate_qr.svg',
                onTap: () => cubit.changeDrawerInstructor(1),
              ),
              DrawerListTile(
                selected:
                    cubit.currentIndexInstructorScreen == 2 ? true : false,
                title: 'Reports',
                icon: 'assets/icons/report.svg',
                onTap: () => cubit.changeDrawerInstructor(2),
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
