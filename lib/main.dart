import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/routes/app_pages.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: AppRoutes.loginscreen,
      getPages: Pages.pages,
    );
  }
}




