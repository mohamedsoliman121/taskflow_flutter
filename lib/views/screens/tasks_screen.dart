import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/tasks_controller.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:taskflow_flutter/views/widgets/textfield.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  
  final TasksController controller = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('المهام'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Get.toNamed(Routes.addtaskscreen);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 1. أزرار الفلترة (الكل، قيد التنفيذ، المكتملة، المتأخرة)
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton('الكل'),
                _buildFilterButton('قيد التنفيذ'),
                _buildFilterButton('المكتملة'),
                _buildFilterButton('المتأخرة'),
              ],
            )),

            const SizedBox(height: 15),

            // 2. حقل البحث
            Textfield(
              hintText: "ابحث عن مهمة",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: null,
              controller: controller.searchController,
              validator: null,
            ),

            const SizedBox(height: 15),

            // 3. قائمة المهام الحقيقية المتفاعلة
            Expanded(
              child: Obx(() {
                if (controller.filteredTasks.isEmpty) {
                  return const Center(
                    child: Text(
                      'لا توجد مهام مطابقة للبحث أو الفلتر',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredTasks.length,
                  itemBuilder: (context, index) {
                    var task = controller.filteredTasks[index];
                    bool isCompleted = task['isCompleted'] ?? false;
                    String priority = task['priority'] ?? 'متوسطة';

                    // تحديد لون نقطة الأولوية
                    Color priorityColor = Colors.green;
                    if (priority == 'عالية') priorityColor = Colors.red;
                    if (priority == 'متوسطة') priorityColor = Colors.amber;

                    return Card(
                      color: Colors.white,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // مربع الاختيار لتغيير الحالة
                            Checkbox(
                              value: isCompleted,
                              onChanged: (val) {
                                controller.toggleTaskStatus(task['id'], isCompleted);
                              },
                            ),
                            
                            // تفاصيل المهمة (العنوان والتاريخ)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    task['title'] ?? '',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                                      color: isCompleted ? Colors.grey : Colors.black,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${task['date']} - ${task['time']}",
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            // نقطة الأولوية
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: priorityColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لتصميم أزرار الفلترة بحيث تتغير ألوانها عند اختيارها
  Widget _buildFilterButton(String title) {
    bool isSelected = controller.currentFilter.value == title;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: isSelected ? 2 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: isSelected ? Colors.blue : Colors.grey.shade300),
        ),
      ),
      onPressed: () {
        controller.changeFilter(title);
      },
      child: Text(title, style: const TextStyle(fontSize: 13)),
    );
  }
}