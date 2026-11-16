import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/services/Task_Service.dart';


class AddtaskController extends GetxController {
  // الكنترولر الخاصة بالنصوص
  final titlecontroller = TextEditingController();
  final descriptionController = TextEditingController();

  // متغيرات الأولوية والقائمة
  var selectedPriority = 'متوسطة'.obs;
  var selectedCategory = Rxn<String>();
  List<String> categories = ['عمل', 'شخصي', 'دراسة', 'أخرى'];

  // 1. متغيرات التاريخ والوقت
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  // 2. دالة اختيار التاريخ
  void chooseDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  // 3. دالة اختيار الوقت
  void chooseTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  // دالة الحفظ أو التحقق (اختياري لاحقاً)

   final TaskService _taskService = TaskService();

  void saveTask() async {
    // 1. التحقق من البيانات
    if (titlecontroller.text.trim().isEmpty) {
      Get.snackbar('تنبيه', 'عنوان المهمة مطلوب', backgroundColor: Colors.orange, colorText: Colors.white);
      return;
    }
    if (selectedDate.value == null || selectedTime.value == null) {
      Get.snackbar('تنبيه', 'التاريخ والوقت إجباريان', backgroundColor: Colors.orange, colorText: Colors.white);
      return;
    }

    try {
 
    String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

      // 2. تجهيز البيانات في شكل Map
      Map<String, dynamic> taskData = {
        'userId': currentUserId ?? '',
        'title': titlecontroller.text.trim(),
        'description': descriptionController.text.trim(),
        'date': selectedDate.value.toString().split(' ')[0], // التاريخ فقط بدون ساعات
        'time': selectedTime.value!.format(Get.context!),   // الوقت بشكل نصي واضح
        'priority': selectedPriority.value,                   // الأولوية المختارة (عالية، متوسطة...)
        'category': selectedCategory.value ?? 'عام',         // القائمة المختارة
        'isCompleted': false,                                 // حالة المهمة مبدئياً غير مكتملة
      };

      // 3. إرسال البيانات لقاعدة البيانات عبر الـ Service
      await _taskService.addTaskToFirestore(taskData);


// تأخير بسيط جداً أو ترك Get.back تنفذ بعد بدء ظهور الرسالة

  Get.back();

   
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء الحفظ: $e', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  
}