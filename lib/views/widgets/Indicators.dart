
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/welcame_controller.dart';



class Indicators extends StatelessWidget {
  final Color? color;
   Indicators({super.key ,  this.color});
final controller = Get.find<WelcameController>();
  @override
  Widget build(BuildContext context) {

    return Obx( ()=>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
        
      2, // توليد 4 نقاط في الـ Row
      (index) {
        // الـ index هنا هيلف: 0, 1, 2, 3
        bool isActive = controller.currentIndex.value == index;
         
        return AnimatedContainer(
          
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8, // لو العنصر الحالي، عرضه 24، وإلا 8
          height: 8,
          decoration: BoxDecoration(
            color: isActive ?  color  : color?.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
        ),
      ),
    );
  }




}