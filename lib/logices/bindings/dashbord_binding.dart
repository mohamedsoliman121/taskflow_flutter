
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/dashbord_controller.dart' show DashbordController;


class DashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashbordController>(DashbordController());
  }
}

