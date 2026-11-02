


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  // Add your controller logic here

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  
final formKey = GlobalKey<FormState>();

final FirebaseAuth _auth = FirebaseAuth.instance;
bool visibility = false ;

void changevisibility () {


visibility = ! visibility ;
update() ;

}
  // دالة إنشاء حساب جديد
  void signUp(  ) async {

    if (!formKey.currentState!.validate()) {
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('خطأ', 'كلمة المرور غير متطابقة', backgroundColor: Colors.orange, colorText: Colors.white);
      return;
    }
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      await userCredential.user?.updateDisplayName(nameController.text.trim());
      Get.back(); // إغلاق التحميل
      Get.snackbar('نجاح', 'تم إنشاء الحساب بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
    Get.offAllNamed(Routes.dashbordscreen);
      // التنقل للشاشة الرئيسية بعد النجاح
      // Get.offAll(() => DashbordScreen());
    } catch (e) {
      Get.back();
      Get.snackbar('خطأ', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void gotologin() {

    Get.toNamed(Routes.loginscreen);
  }

  void dashbordscreen() {
    Get.toNamed(Routes.dashbordscreen);
  }

  @override
  void onClose() {
    // تنظيف الذاكرة للكنترولرات
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
} 