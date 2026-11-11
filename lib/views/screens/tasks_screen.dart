


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/tasks_controller.dart';
import 'package:taskflow_flutter/views/widgets/textfield.dart';


class TasksScreen extends StatelessWidget {
   TasksScreen({super.key});
  final TasksController controller = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('المهام')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set the desired border radius
        ),
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
      ),
      body: SizedBox(
        width: double.infinity,
       height: double.infinity,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
          
             child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
               children: [
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue, // Set the background color
               ),
               onPressed: () {}, child: Text('الكل')),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white, // Set the background color
               ),
               onPressed: () {}, child: Text('قيد التنفيذ')),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white, // Set the background color
               ),
               onPressed: () {}, child: Text(' المكتملة')),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white, // Set the background color
               ),
               onPressed: () {}, child: Text(' المتأخرة')),
             ],),
           ),
           SizedBox(height: 20,),
           Textfield(hintText: "ابحث عن مهمة", prefixIcon: Icon(Icons.search), suffixIcon: null, controller: controller.searchController, validator: null) ,
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio(value: false),
            Column(
              children: [
                 SizedBox(height: 10,),
                Container(
                  color: Colors.yellow,
                  child: Text('متوسطة')),
  
              ],
          
            ) , 
                   Column(
              children: [
                 Text('مراجعة كود المشروع'),
                Text('اليوم . 1.:00 PM'),
  
              ],
          
            ) , 
Container(
  width: 12,  // عرض النقطة
  height: 12, // ارتفاع النقطة
  decoration: const BoxDecoration(
    color: Colors.yellow, // لون النقطة
    shape: BoxShape.circle, // يجعل الكونتير دائرياً تماماً
  ),
)
          ],
         ) ,

         ],
       ),
      )
    );
  }
}