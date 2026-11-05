


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';



class Settingsscreen extends StatelessWidget {
    Settingsscreen({super.key});

  final SettingsController controller = Get.find<SettingsController>() ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:  AppBar(
          title: Text("الاعدادات "),





      ),
      body: Text(controller.x.toString()),
    ) ;
  }






} 