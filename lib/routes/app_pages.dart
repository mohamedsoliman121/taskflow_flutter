import 'package:taskflow_flutter/logices/bindings/dashbord_binding.dart';
import 'package:taskflow_flutter/logices/bindings/forgetpassword_binding.dart';
import 'package:taskflow_flutter/logices/bindings/login_binding.dart';
import 'package:taskflow_flutter/logices/bindings/settings_binding.dart';
import 'package:taskflow_flutter/logices/bindings/signup_binding.dart';
import 'package:taskflow_flutter/logices/bindings/welcame_binding.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/views/screens/auth/forgetpassword.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';
import 'package:taskflow_flutter/views/screens/auth/signup.dart';
import 'package:taskflow_flutter/views/screens/dashbord_screen.dart';
import 'package:taskflow_flutter/views/screens/settings_screen.dart';
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
    GetPage(
      name: AppRoutes.loginscreen,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signupscreen,
      page: () => Signup(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.dashbordscreen,
      page: () => DashbordScreen(),
      binding:  
      DashbordBinding() 

      ,
    ),
    GetPage(
      name: AppRoutes.forgetpasswordscreen,
      page: () => ForgetpasswordScreen(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.settingsscreen,
      page: () => Settingsscreen(),
      binding: Settingsbinding(),
    ),
  ];
}
