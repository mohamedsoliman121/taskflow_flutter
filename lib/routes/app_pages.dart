
import 'package:taskflow_flutter/logices/bindings/welcame_binding.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
// import 'package:taskflow_flutter/views/screens/pageview.dart';
import 'package:taskflow_flutter/views/screens/welcamescreen.dart';


class Pages {
  
 static final pages = [
  GetPage(
    name: AppRoutes.welcamescreen,
    page: () =>  Welcamescreen(),
    binding: WelcameBinding() , 
  ),
  //   GetPage(
  //   name: AppRoutes.pageview,
  //   page: () =>  Pageview(),
  //   // binding: WelcameBinding() , 
  // ),
];

}

