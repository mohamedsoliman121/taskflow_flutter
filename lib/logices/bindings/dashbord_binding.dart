
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/dashbord_controller.dart' show DashbordController;
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';


class DashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashbordController>(DashbordController());
Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
Get.lazyPut<HomeController>(()=> HomeController() , fenix: true);
  }
}

