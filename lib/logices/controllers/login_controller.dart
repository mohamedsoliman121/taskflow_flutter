

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';

class LoginController extends GetxController {


final TextEditingController emailcontroller = TextEditingController() ;
final TextEditingController passwordcontroller = TextEditingController();

final formKey = GlobalKey<FormState>();
final FirebaseAuth _auth = FirebaseAuth.instance;
bool isvisvilty = false ;

void changeisvis () {

isvisvilty = !isvisvilty ;
update() ;

}

void login () async {
 if (!formKey.currentState!.validate()) {

 return ;

 }
try {

Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);


await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      Get.back(); // إغلاق شاشة التحميل
      Get.snackbar('نجاح', 'تم تسجيل الدخول بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
      
      // الانتقال للوحة التحكم وحذف شاشات الدخول من الذاكرة
      Get.offAllNamed(Routes.dashbordscreen);
      
    } catch (e) {
      Get.back();
      Get.snackbar('خطأ', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

void gotosignup () {
  Get.toNamed(Routes.signupscreen) ;
}

@override
void onClose () {
emailcontroller.dispose() ;
passwordcontroller.dispose();
super.onClose();

}


}