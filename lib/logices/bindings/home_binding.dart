
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';
import 'package:taskflow_flutter/utils/locale_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(HomeController()) ;
   Get.lazyPut<MyLocaleController>(() => MyLocaleController(), fenix: true);
  }
}