
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/dashbord_controller.dart';



class DashbordScreen extends StatelessWidget {
   DashbordScreen({super.key});
 final controller = Get.put<DashbordController>(DashbordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]()),
      bottomNavigationBar: Obx (() => Container(
      //  height: 70,
        margin: const EdgeInsets.only(left: 10, right: 10 , bottom: 50 , top: 10),
        
        decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
       ) ,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            onTap: controller.onItemTapped,
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue, // لون الأيقونة النشطة
              unselectedItemColor: Colors.grey, // لون الأيقونات غير النشطة
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
                BottomNavigationBarItem(
                icon: Icon(Icons.task,) ,
                label: 'المهام',
              ),
                 BottomNavigationBarItem(
              
                icon: Container(
             padding: const EdgeInsets.all(10),
        //     margin: const EdgeInsets.only(bottom: 70),
    decoration: BoxDecoration(
      color: controller.selectedIndex.value == 2 ? Colors.blue.withValues(alpha: 0.2) : Colors.transparent,
      shape: BoxShape.circle, // شكل دائري
    ),
                  child: Icon(Icons.calendar_month , color: controller.selectedIndex.value == 2 ? Colors.blue : Colors.grey,),),
                label: 'التقويم',
              ),
                 BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart),
                label: 'الاحصائيات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الاعدادت',
              ),
            ],
          ),
        ),
      ),
      ) , ) ;

  }
}