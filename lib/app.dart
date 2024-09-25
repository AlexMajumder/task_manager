import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});// progress 39min done ..

  @override
  _TaskManagerAppState createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: const TextTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData()
      ),
      home: const SplashScreen(),
    );
  }

  InputDecorationTheme _inputDecorationTheme(){
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
      errorBorder: _inputBorder(),
    );
  }

  OutlineInputBorder _inputBorder(){
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8))),
    );
  }


}
