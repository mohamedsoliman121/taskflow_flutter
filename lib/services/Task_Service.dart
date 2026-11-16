


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  // 1. إضافة مهمة جديدة
  Future<void> addTaskToFirestore(Map<String, dynamic> taskData) async {
    await _firestore.collection('tasks').add(taskData);
  }

  // 2. جلب مهام المستخدم الحالي (Stream لحظي)
  Stream<QuerySnapshot> getUserTasksStream() {
    return _firestore
        .collection('tasks')
        .where('userId', isEqualTo: currentUserId)
        .snapshots();
  }

  // 3. تحديث حالة المهمة (مكتملة / غير مكتملة)
  Future<void> updateTaskStatus(String taskId, bool isCompleted) async {
    await _firestore.collection('tasks').doc(taskId).update({
      'isCompleted': isCompleted,
    });
  }

  // 4. حذف مهمة
  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }
}