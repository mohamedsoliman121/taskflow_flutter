
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/Statistics_controller.dart';
import 'package:taskflow_flutter/logices/controllers/calender_controller.dart';
import 'package:taskflow_flutter/logices/controllers/dashbord_controller.dart' show DashbordController;
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';
import 'package:taskflow_flutter/logices/controllers/tasks_controller.dart';


class DashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashbordController>(DashbordController());
Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
Get.lazyPut<HomeController>(()=> HomeController() , fenix: true);
Get.lazyPut<TasksController>(() => TasksController(), fenix: true);
Get.lazyPut<CalendarController>(() => CalendarController(), fenix: true);
Get.lazyPut<StatisticsController>(() => StatisticsController(), fenix: true);
  }
}

