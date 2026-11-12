import 'package:taskflow_flutter/logices/bindings/Statistics_binding.dart';
import 'package:taskflow_flutter/logices/bindings/addtask_binding.dart';
import 'package:taskflow_flutter/logices/bindings/calender_binding.dart';
import 'package:taskflow_flutter/logices/bindings/dashbord_binding.dart';
import 'package:taskflow_flutter/logices/bindings/forgetpassword_binding.dart';
import 'package:taskflow_flutter/logices/bindings/home_binding.dart';
import 'package:taskflow_flutter/logices/bindings/login_binding.dart';
import 'package:taskflow_flutter/logices/bindings/settings_binding.dart';
import 'package:taskflow_flutter/logices/bindings/signup_binding.dart';
import 'package:taskflow_flutter/logices/bindings/tasks_binding.dart';
import 'package:taskflow_flutter/logices/bindings/welcame_binding.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/views/screens/Statistics_Screen.dart';
import 'package:taskflow_flutter/views/screens/addtask_screen.dart';
import 'package:taskflow_flutter/views/screens/auth/forgetpassword.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';
import 'package:taskflow_flutter/views/screens/auth/signup.dart';
import 'package:taskflow_flutter/views/screens/calendar_screen.dart';
import 'package:taskflow_flutter/views/screens/dashbord_screen.dart';
import 'package:taskflow_flutter/views/screens/home_screen.dart';
import 'package:taskflow_flutter/views/screens/settings_screen.dart';
import 'package:taskflow_flutter/views/screens/tasks_screen.dart';
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
      binding: DashbordBinding(),
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
    GetPage(
      name: AppRoutes.taskscreen,
      page: () => TasksScreen(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.calenderscreen,
      page: () => CalendarScreen(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: AppRoutes.statisticsscreen,
      page: () => Statisticsscreen(),
      binding: Statisticsbinding(),
    ),
    GetPage(
      name: AppRoutes.addtaskscreen,
      page: () => AddtaskScreen(),
      binding: AddtaskBinding(),
    ),
  ];
}
