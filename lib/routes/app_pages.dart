import 'package:taskflow_flutter/logices/bindings/login_binding.dart';
import 'package:taskflow_flutter/logices/bindings/signup_binding.dart';
import 'package:taskflow_flutter/logices/bindings/welcame_binding.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';
import 'package:taskflow_flutter/views/screens/auth/signup.dart';
// import 'package:taskflow_flutter/views/screens/pageview.dart';
import 'package:taskflow_flutter/views/screens/welcamescreen.dart';

class Pages {
  static final pages = [
    GetPage(
      name: AppRoutes.welcamescreen,
      page: () => Welcamescreen(),
      binding: WelcameBinding(),
    ),
    //   GetPage(
    //   name: AppRoutes.pageview,
    //   page: () =>  Pageview(),
    //   // binding: WelcameBinding() ,
    // ),
    GetPage(name: AppRoutes.loginscreen, 
    page: () => Login() , 
    binding: LoginBinding()
    ),
    GetPage(name: AppRoutes.signupscreen, 
    page: () => Signup() , 
    binding: SignupBinding()
    ),
  ];
}
