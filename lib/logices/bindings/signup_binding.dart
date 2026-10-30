
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}