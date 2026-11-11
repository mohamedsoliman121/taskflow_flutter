
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/calender_controller.dart';

class CalendarScreen extends StatelessWidget {
   CalendarScreen({super.key});
   
final CalendarController controller = Get.find<CalendarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التقويم'),
      ),
      body: SafeArea(


        child: Column(
          children: [


SizedBox(
  width: double.infinity,
  height: 400,                              
  child: CalendarDatePicker(
    
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    onDateChanged: (date) {
      // Handle date change
    },
  ),
) , 



            Card(
              child: ListTile(
             leading: Icon(
              Icons.circle,
              size: 12, // التحكم بحجم النقطة
              color: Colors.blue, // لون النقطة
            ) ,
              title: Text('Calendar Screen'),
              subtitle: Text('This is the calendar screen.'),
            ),),
          ],
        ) , 
      ),
    );
  }
}