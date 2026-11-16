import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/calender_controller.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
   
  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('التقويم'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. تقويم فلاتر التفاعلي
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    // استدعاء الكنترولر لتحديث البيانات عند تغيير التاريخ
                    controller.changeSelectedDate(date);
                  },
                ),
              ),
              
              const SizedBox(height: 10),
              
              // عنوان يوضح تاريخ اليوم المختار
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Obx(() => Text(
                    "مهام يوم: ${controller.selectedDate.value.toIso8601String().split('T')[0]}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                ),
              ),

              const SizedBox(height: 10),

              // 2. قائمة المهام الخاصة بالتاريخ المختار
              Obx(() {
                if (controller.tasksForDate.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'لا توجد مهام مسجلة في هذا اليوم',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.tasksForDate.length,
                  itemBuilder: (context, index) {
                    var task = controller.tasksForDate[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.circle,
                          size: 14,
                          color: Colors.blue,
                        ),
                        title: Text(
                          task['title'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "الوقت: ${task['time']} | الأولوية: ${task['priority']}",
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Checkbox(
                          value: task['isCompleted'] ?? false,
                          onChanged: (val) {
                            // يمكنك هنا إضافة تحديث حالة المهمة
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}