import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:students_attendance_system_web/shared/cubit/cubit.dart';
import 'package:students_attendance_system_web/shared/cubit/states.dart';
import 'package:students_attendance_system_web/shared/styles/themes.dart';
import 'screens/Welcome/welcome_screen.dart';
import 'layout/components/menu_app_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SAS',
            theme: appTheme,
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
