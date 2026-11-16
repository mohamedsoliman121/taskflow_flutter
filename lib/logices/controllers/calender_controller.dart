import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  // التاريخ المحدد حالياً في التقويم (افتراضياً اليوم)
  var selectedDate = DateTime.now().obs;

  // قائمة المهام الخاصة بالتاريخ المحدد
  var tasksForDate = [].obs;

  @override
  void onInit() {
    super.onInit();
    // جلب مهام تاريخ اليوم عند فتح الشاشة
    fetchTasksForDate(selectedDate.value);
  }

  // دالة تغيير التاريخ وجلب مهامه
  void changeSelectedDate(DateTime date) {
    selectedDate.value = date;
    fetchTasksForDate(date);
  }

  // استعلام فايربيز لجلب المهام حسب التاريخ والـ userId
  void fetchTasksForDate(DateTime date) {
    // تنسيق التاريخ ليطابق الشكل المخزن في قاعدة البيانات (مثلاً: 2026-06-22)
    String formattedDate = date.toIso8601String().split('T')[0];

    _firestore
        .collection('tasks')
        .where('userId', isEqualTo: currentUserId)
        .where('date', isEqualTo: formattedDate)
        .snapshots()
        .listen((snapshot) {
      tasksForDate.value = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }
}