

import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/forget_controller.dart';

class ForgetpasswordBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(Forgetpasswordcontroller());
  }

}