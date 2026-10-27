

import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/welcame_controller.dart';

class WelcameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WelcameController()) ;
  }




}