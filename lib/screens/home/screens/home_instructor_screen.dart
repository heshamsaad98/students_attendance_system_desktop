import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_attendance_system_web/screens/home/components/header.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../components/custom_home_card.dart';

class HomeInstructorScreen extends StatelessWidget {
  const HomeInstructorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomHomeCard(
                            icon: 'assets/icons/generate_qr.svg',
                            nameData: 'Create presence',
                            startColor: const Color(0xff6DC8F3),
                            endColor: const Color(0xff73A1F9),
                            onTap: () => cubit.changeDrawerInstructor(1),
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          CustomHomeCard(
                            icon: 'assets/icons/report.svg',
                            nameData: 'Reports',
                            startColor: const Color(0xffFFB157),
                            endColor: const Color(0xffFFA057),
                            onTap: () => cubit.changeDrawerInstructor(2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
