
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/tasks_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(TasksController());
  }


}