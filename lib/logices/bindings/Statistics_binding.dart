


import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/Statistics_controller.dart';

class Statisticsbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}