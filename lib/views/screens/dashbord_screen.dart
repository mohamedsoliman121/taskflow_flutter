import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/dashbord_controller.dart';

class DashbordScreen extends StatelessWidget {
  DashbordScreen({super.key});
  
  final controller = Get.put<DashbordController>(DashbordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50, // خلفية خفيفة تبرز الشاشة العائمة
      body: Obx(() => controller.screens[controller.selectedIndex.value]()),
      
      bottomNavigationBar: Obx(() => Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16), // هوامش متوازنة ومريحة للعين
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08), // ظل خفيف وغير مزعج
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
            onTap: controller.onItemTapped,
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0, // إزالة ظل الـ BottomNavigationBar الافتراضي ليعتمد على الـ Container
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey.shade400,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'الرئيسية',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_rounded),
                label: 'المهام',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex.value == 2 
                        ? Colors.blue.withOpacity(0.15) 
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.calendar_month_rounded, 
                    color: controller.selectedIndex.value == 2 ? Colors.blueAccent : Colors.grey.shade400,
                    size: 22,
                  ),
                ),
                label: 'التقويم',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded),
                label: 'الاحصائيات',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: 'الاعدادت',
              ),
            ],
          ),
        ),
      )),
    );
  }
}