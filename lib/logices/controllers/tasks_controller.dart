import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  final TextEditingController searchController = TextEditingController();

  // قائمة جميع المهام الأصلية
  var allTasks = [].obs;
  // قائمة المهام المعروضة (بعد تطبيق الفلتر أو البحث)
  var filteredTasks = [].obs;

  // حالة الفلتر الحالي ('الكل', 'قيد التنفيذ', 'المكتملة', 'المتأخرة')
  var currentFilter = 'الكل'.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
    
    // الاستماع لحقل البحث لتحديث النتائج فوراً عند الكتابة
    searchController.addListener(() {
      searchQuery.value = searchController.text.trim();
      filterTasks();
    });
  }

  // جلب المهام من فايربيز
  void fetchTasks() {
    _firestore
        .collection('tasks')
        .where('userId', isEqualTo: currentUserId)
        .snapshots()
        .listen((snapshot) {
      allTasks.value = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();

      filterTasks(); // تطبيق الفلتر الحالي بعد جلب البيانات
    });
  }

  // تغيير الفلتر عند الضغط على الأزرار
  void changeFilter(String filterName) {
    currentFilter.value = filterName;
    filterTasks();
  }

  // منطق الفلترة والبحث معاً
  void filterTasks() {
    List<dynamic> results = allTasks; // <-- إضافة كلمة var هنا

    // 1. تصفية حسب الحالة (فلتر الأزرار)
    if (currentFilter.value == 'قيد التنفيذ') {
      results = results.where((task) => task['isCompleted'] == false).toList();
    } else if (currentFilter.value == 'المكتملة') {
      results = results.where((task) => task['isCompleted'] == true).toList();
    } else if (currentFilter.value == 'المتأخرة') {
      results = results.where((task) => task['isCompleted'] == false).toList();
    }

    // 2. تصفية حسب البحث (Search)
    if (searchQuery.value.isNotEmpty) {
      results = results.where((task) {
        String title = task['title']?.toString().toLowerCase() ?? '';
        String desc = task['description']?.toString().toLowerCase() ?? '';
        return title.contains(searchQuery.value.toLowerCase()) ||
               desc.contains(searchQuery.value.toLowerCase());
      }).toList();
    }

    filteredTasks.value = results;
  }
  // تحديث حالة المهمة (عند النقر على الـ Checkbox)
  Future<void> toggleTaskStatus(String taskId, bool currentStatus) async {
    await _firestore.collection('tasks').doc(taskId).update({
      'isCompleted': !currentStatus,
    });
  }
}