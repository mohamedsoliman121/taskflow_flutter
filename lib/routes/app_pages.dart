
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/views/screens/splashscreen.dart';


class Pages {
  
 static final pages = [
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const Splashscreen(),
  ),
];

}

