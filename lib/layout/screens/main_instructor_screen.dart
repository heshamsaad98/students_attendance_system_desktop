import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/side_menu/shared/side_menu_instructor.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/responsive.dart';
import '../components/menu_app_controller.dart';

class MainInstructorScreen extends StatelessWidget {
  const MainInstructorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          key: context.read<MenuAppController>().scaffoldKey,
          drawer: const SideMenuInstructor(),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: SideMenuInstructor(),
                  ),
                Expanded(
                  flex: 5,
                  child: cubit
                      .screenInstructor[cubit.currentIndexInstructorScreen],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
