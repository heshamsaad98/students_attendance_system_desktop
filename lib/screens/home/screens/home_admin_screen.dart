import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_attendance_system_web/screens/home/components/header.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../components/custom_home_card.dart';

class HomedAdminScreen extends StatelessWidget {
  const HomedAdminScreen({Key? key}) : super(key: key);

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
                            icon: 'assets/icons/students.svg',
                            nameData: 'Students',
                            numOfData: '794',
                            startColor: const Color(0xff6DC8F3),
                            endColor: const Color(0xff73A1F9),
                            onTap: () => cubit.changeDrawerAdmin(1),
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          CustomHomeCard(
                            icon: 'assets/icons/teacher.svg',
                            nameData: 'Instructors',
                            numOfData: '20',
                            startColor: const Color(0xffFFB157),
                            endColor: const Color(0xffFFA057),
                            onTap: () => cubit.changeDrawerAdmin(2),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        children: [
                          CustomHomeCard(
                            icon: 'assets/icons/book.svg',
                            nameData: 'Courses',
                            numOfData: '49',
                            startColor: const Color(0xffFF5B95),
                            endColor: const Color(0xffF8556D),
                            onTap: () => cubit.changeDrawerAdmin(3),
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          CustomHomeCard(
                            icon: 'assets/icons/departments.svg',
                            nameData: 'Departments',
                            numOfData: '7',
                            startColor: const Color(0xffD76EF5),
                            endColor: const Color(0xff8F7AFE),
                            onTap: () => cubit.changeDrawerAdmin(4),
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
