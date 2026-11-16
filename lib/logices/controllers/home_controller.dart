import 'package:get/get.dart';
import 'package:taskflow_flutter/services/Task_Service.dart';

class HomeController extends GetxController {
  final TaskService _taskService = TaskService();

  // لستة تخزين المهام القادمة من الفايربيز
  var tasksList = [].obs;

  // عدادات الإحصائيات
  var totalTasks = 0.obs;
  var completedTasks = 0.obs;
  var pendingTasks = 0.obs;
  var uncompletedTasks = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // الاستماع الفوري لتغييرات البيانات من فايربيز
    bindTasksStream();
  }

  void bindTasksStream() {
    _taskService.getUserTasksStream().listen((snapshot) {
      tasksList.value = snapshot.docs.map((doc) {
        // var data = doc.data();
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // حفظ معرف المستند للحذف أو التعديل لاحقاً
        return data;
      }).toList();

      // حساب الإحصائيات تلقائياً
      totalTasks.value = tasksList.length;
      completedTasks.value = tasksList.where((task) => task['isCompleted'] == true).length;
      pendingTasks.value = totalTasks.value - completedTasks.value;
      uncompletedTasks.value = 0; // يمكنك ربطها بحالة معينة إذا أردت
    });
  }
}