
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';
import 'package:taskflow_flutter/utils/theme_controller.dart';

class Settingsbinding extends Bindings {
  @override
  void dependencies() {
  

  Get.put(SettingsController()) ;

Get.put(ThemeController()) ;
  }





}