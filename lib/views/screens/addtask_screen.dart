

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/addtask_controller.dart';


class AddtaskScreen extends  StatelessWidget{
   AddtaskScreen({super.key});
  final AddtaskController controller = Get.find<AddtaskController>() ;

  @override
  Widget build(Object context) {
    
    return Scaffold(

body: Center(child: Text("add task"),),

    ) ;



  }
}