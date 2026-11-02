import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/firebase_options.dart';
import 'package:taskflow_flutter/routes/app_pages.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
// import 'package:taskflow_flutter/views/screens/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
final User? user = FirebaseAuth.instance.currentUser;

final String route = (user != null) ? AppRoutes.dashbordscreen : AppRoutes.welcamescreen ;  

runApp(MyApp(route : route));
}

class MyApp extends StatelessWidget {
  final String route;
   const MyApp({super.key , required this.route});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: route,
      getPages: Pages.pages,
    );
  }
}




