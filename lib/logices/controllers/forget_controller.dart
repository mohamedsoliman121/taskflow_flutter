

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpasswordcontroller extends GetxController {

TextEditingController emailcontroller = TextEditingController() ;

int x = 120 ; 
Timer? _timer;
bool isButtonEnabled = true; // Flag to track button state

void timeupdate() {
    // إذا كان التايمر شغال مسبقاً، لا تبدأ واحة جديدة
    if (_timer != null && _timer!.isActive) return;

    isButtonEnabled = false;
    x = 120;
    update(); // تحديث الواجهة لتعطيل الزر

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (x > 0) {
        x--;
        update(); // تحديث العداد كل ثانية
      } else {
        // عندما ينتهي الوقت
        timer.cancel();
        x = 120;
        isButtonEnabled = true; // إعادة تفعيل الزر
        update(); // تحديث الواجهة لإرجاع شكل الزر
      }
    });
  }



Future<void> resetPassword() async {
    try {
      if (emailcontroller.text.trim().isEmpty) {
        Get.snackbar('خطأ', 'الرجاء إدخال البريد الإلكتروني أولاً');
        return;
      }

      // إرسال الإيميل عبر فايربيز
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text.trim());

      // تشغيل العداد بعد النجاح في إرسال الإيميل
      timeupdate();

      Get.snackbar(
        'نجاح', 
        'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message = 'حدث خطأ ما';
      if (e.code == 'user-not-found') {
        message = 'لا يوجد حساب مسجل بهذا البريد الإلكتروني.';
      } else if (e.code == 'invalid-email') {
        message = 'البريد الإلكتروني المدخل غير صالح.';
      }
      Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    emailcontroller.dispose();
    super.onClose();
  }
}