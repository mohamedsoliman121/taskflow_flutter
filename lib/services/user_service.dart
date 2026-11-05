


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskflow_flutter/models/user_model.dart'; // استدعي الموديل الذي أنشأته

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // دالة حفظ بيانات المستخدم باستخدام الـ Model
  Future<void> saveUserData(UserModel userModel) async {
    try {
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toMap());
    } catch (e) {
      throw Exception('فشل في حفظ بيانات المستخدم: $e');
    }
  }

  // دالة لجلب بيانات المستخدم لاحقاً كـ Model جاهز
  Future<UserModel?> getUserData(String uid) async {
    try {
      var doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromMap(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception('فشل في جلب بيانات المستخدم: $e');
    }
  }
}