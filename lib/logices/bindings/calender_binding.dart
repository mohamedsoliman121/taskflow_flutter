


import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/calender_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(CalendarController());
  }
}
