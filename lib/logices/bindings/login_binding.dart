

import 'package:get/instance_manager.dart';
import 'package:taskflow_flutter/logices/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
 Get.put(LoginController()) ;
  }



}