
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(HomeController()) ;
  }
}