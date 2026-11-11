

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/Statistics_controller.dart';

class Statisticsscreen extends StatelessWidget {
   Statisticsscreen({super.key});


  final StatisticsController controller = Get.find<StatisticsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Statistics Screen'),
      ),
    );
  }
}