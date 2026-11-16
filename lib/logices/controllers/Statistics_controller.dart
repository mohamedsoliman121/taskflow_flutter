import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  // المتغيرات المتفاعلة
  var totalTasks = 0.obs;
  var completedTasks = 0.obs;
  var pendingTasks = 0.obs;
  var overdueTasks = 0.obs; // متأخرة
  
  // نسب الإنجاز (من 0.0 إلى 1.0 لعرضها في الدائرة)
  var completionPercentage = 0.0.obs;
  var completionPercentageText = '0%'.obs;

  // عدادات حسب الأولوية
  var highPriorityCount = 0.obs;
  var mediumPriorityCount = 0.obs;
  var lowPriorityCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStatistics();
  }

  void fetchStatistics() {
    _firestore
        .collection('tasks')
        .where('userId', isEqualTo: currentUserId)
        .snapshots()
        .listen((snapshot) {
      var tasks = snapshot.docs;
      
      totalTasks.value = tasks.length;
      
      if (totalTasks.value > 0) {
        completedTasks.value = tasks.where((doc) => doc.data()['isCompleted'] == true).length;
        pendingTasks.value = tasks.where((doc) => doc.data()['isCompleted'] == false).length;
        
        // حساب نسبة الإنجاز
        double percentage = (completedTasks.value / totalTasks.value);
        completionPercentage.value = percentage;
        completionPercentageText.value = "${(percentage * 100).toStringAsFixed(0)}%";
      } else {
        completedTasks.value = 0;
        pendingTasks.value = 0;
        completionPercentage.value = 0.0;
        completionPercentageText.value = '0%';
      }

      // حساب حسب الأولوية
      highPriorityCount.value = tasks.where((doc) => doc.data()['priority'] == 'عالية').length;
      mediumPriorityCount.value = tasks.where((doc) => doc.data()['priority'] == 'متوسطة').length;
      lowPriorityCount.value = tasks.where((doc) => doc.data()['priority'] == 'منخفضة').length;
    });
  }
}