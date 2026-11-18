import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskflow_flutter/firebase_options.dart';
import 'package:taskflow_flutter/utils/lang.dart';
import 'package:taskflow_flutter/utils/locale_controller.dart';
import 'package:taskflow_flutter/utils/theme_controller.dart';
import 'package:taskflow_flutter/routes/app_pages.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
// import 'package:taskflow_flutter/views/screens/auth/login.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
final User? user = FirebaseAuth.instance.currentUser;

final String route = (user != null) ? AppRoutes.dashbordscreen : AppRoutes.welcamescreen ;  
    Get.put(MyLocaleController());
runApp(MyApp(route : route));
}

class MyApp extends StatelessWidget {
  final String route;
    MyApp({super.key , required this.route});
  final ThemeController themeController = Get.put(ThemeController());
 final MyLocaleController controller = Get.find<MyLocaleController>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
  
      // تصميم الوضع الفاتح (يمكنك تخصيص ألوانك هنا)
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      
      // تصميم الوضع الليلي (يمكنك تخصيص ألوانك هنا)
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white      ),
      
      // هنا يأخذ التطبيق حالته المحفوظة بمجرد الفتح
      themeMode: themeController.theme,
      
translations: MyMessages(), // ربط ملف الترجمات
      locale: controller.initialLocale, // جلب اللغة المحفوظة محلياً عند الفتح
      fallbackLocale: Locale('en', 'US'), // اللغة الاحتياطية إذا حدث خطأ
      initialRoute: route,
      getPages: Pages.pages,
    );
  }
}




