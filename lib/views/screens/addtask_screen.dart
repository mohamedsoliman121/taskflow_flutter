import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/addtask_controller.dart';

class AddtaskScreen extends StatelessWidget {
  AddtaskScreen({super.key});
  
  final AddtaskController controller = Get.find<AddtaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أضافة مهمة جديدة"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // 1. عنوان المهمة
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: controller.titlecontroller,
                      decoration: InputDecoration(
                        hintText: "ادخل عنوان المهمة",
                        labelText: "عنوان المهمة",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),

                const Text("ادخل وصف المهمة"),
                const SizedBox(height: 5),
                
                // 2. وصف المهمة
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controller.descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "الوصف (اختيارى)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                const Text('التاريخ والوقت'),
                const SizedBox(height: 5),
                
                // 3. التاريخ والوقت (مربوط بالكنترولر ويفتح التقويم والساعة)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      // حقل الوقت
                      Expanded(
                        child: Obx(() => InkWell(
                          onTap: () => controller.chooseTime(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'الوقت',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              controller.selectedTime.value == null
                                  ? 'اختر الوقت'
                                  : controller.selectedTime.value!.format(context),
                              style: TextStyle(
                                color: controller.selectedTime.value == null ? Colors.grey : Colors.black,
                              ),
                            ),
                          ),
                        )),
                      ),
                      
                      const SizedBox(width: 10), 
                      
                      // حقل التاريخ
                      Expanded(
                        child: Obx(() => InkWell(
                          onTap: () => controller.chooseDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'التاريخ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              controller.selectedDate.value == null
                                  ? 'اختر التاريخ'
                                  : "${controller.selectedDate.value!.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                color: controller.selectedDate.value == null ? Colors.grey : Colors.black,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ), 

                const SizedBox(height: 10),
                const Text("الأولوية"),
                const SizedBox(height: 8),
                
                // 4. أزرار الأولوية
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildPriorityButton('عالية', Colors.red),
                      buildPriorityButton('متوسطة', Colors.amber),
                      buildPriorityButton('منخفضة', Colors.green),
                    ],
                  ),
                ), 

                const SizedBox(height: 20),
                
                const Text(
                  'القائمة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),

                // 5. القائمة المنسدلة
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedCategory.value,
                  hint: const Text('اختر القائمة'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  items: controller.categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.selectedCategory.value = newValue;
                  },
                )),
                
                const SizedBox(height: 30),
                
                // 6. زر الإضافة
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // استدعاء دالة الحفظ أو التحقق
                      // controller.saveTaskToDatabase();
                             controller.saveTask();
                    }, 
                    child: const Text(
                      "اضافة مهمة جديدة",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لبناء أزرار الأولوية بشكل ديناميكي
  Widget buildPriorityButton(String title, Color dotColor) {
    return Obx(() {
      bool isSelected = controller.selectedPriority.value == title;
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: isSelected ? 2 : 0,
        ),
        onPressed: () {
          controller.selectedPriority.value = title;
   
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue.shade900 : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}