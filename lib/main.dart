import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/routes/app_pages.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';

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
      home:  MyHomePage(),
      initialRoute: AppRoutes.splashscreen,
      getPages: Pages.pages,
    );
  }
}

 class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

   return Scaffold(

   ); 
  }




 }


