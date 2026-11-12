

import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/addtask_controller.dart';

class AddtaskBinding extends Bindings{
  @override
  void dependencies() {
 Get.put(AddtaskController()) ;
  }
}