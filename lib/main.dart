// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intesasoft_case_study/controllers/controller.dart';
import 'package:intesasoft_case_study/utils/colors.dart';

import 'screens/home_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CitiesController c = Get.put(CitiesController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //  appBarTheme: const AppBarTheme(color: Colors.white),
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}
