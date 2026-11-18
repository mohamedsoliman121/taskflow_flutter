

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskflow_flutter/services/profile_upload.dart';

class SettingsController  extends GetxController {





  final StorageService _storageService = StorageService();
  final ImagePicker _picker = ImagePicker();

  // متغير لتخزين الصورة محلياً قبل الرفع
  Rxn<File> selectedImage = Rxn<File>();
  
  // رابط صورة البروفيل (يمكن جلبه من Firestore لاحقاً)
  var profileImageUrl = ''.obs;
  var isLoading = false.obs;

  // دالة اختيار الصورة من المعرض
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
      // رفع الصورة تلقائياً بمجرد اختيارها
      await uploadAndSaveImage();
    }
  }

  // دالة الرفع للـ Storage وحفظ الرابط في Firestore
  Future<void> uploadAndSaveImage() async {
    if (selectedImage.value == null) return;

    try {
      isLoading.value = true;
      
      // 1. رفع الصورة وجلب اللينك
      String? downloadUrl = await _storageService.uploadProfileImage(selectedImage.value!);

      if (downloadUrl != null) {
        profileImageUrl.value = downloadUrl;
        
        // 2. حفظ الرابط في قاعدة بيانات Firestore تحت بيانات المستخدم الحالي
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'profileImageUrl': downloadUrl,
        }, SetOptions(merge: true));

        Get.snackbar('نجاح', 'تم تحديث صورة البروفيل بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('خطأ', 'فشل رفع الصورة: $e', backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }





  
}