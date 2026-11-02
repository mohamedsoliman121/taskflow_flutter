

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:google_sign_in/google_sign_in.dart'; // لا تنسَ عمل الاستيراد


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
  void onInit() {
    super.onInit();
    // 1. تهيئة Google Sign-In عند بدء الكنترولر (حسب التوثيق الحديث)
GoogleSignIn.instance.initialize(); 

 }
// تهيئة مثيل جوجل

void signInWithGoogle() async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      // 1. فتح نافذة تسجيل الدخول (في الإصدار 7 تُرجع الكائن مباشرة أو ترمي خطأ عند الإلغاء)
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

      // 2. جلب بيانات المصادقة (في الإصدار 7 أصبحت عملية متزامنة بدون await)
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // 3. إنشاء بيانات الاعتماد الخاصة بـ Firebase باستخدام idToken فقط
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // 4. تسجيل الدخول في Firebase
      await _auth.signInWithCredential(credential);

      Get.back(); // إغلاق شاشة التحميل
      Get.snackbar('نجاح', 'تم تسجيل الدخول بواسطة جوجل بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
      
      Get.offAllNamed(Routes.dashbordscreen);

    } catch (e) {
      Get.back();
      // إذا قام المستخدم بإغلاق نافذة جوجل سيصل هنا خطأ الإلغاء
    //  print("Google Sign-In Error: $e");
    }
  }

// void signInWithFacebook() async {
//   try {
//     Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

//     // 1. بدء عملية تسجيل الدخول عبر فيسبوك
//     final LoginResult result = await FacebookAuth.instance.login(
//       permissions: ['email', 'public_profile'],
//     );

//     if (result.status == LoginStatus.success) {
//       // 2. الحصول على رمز الوصول (Access Token)
//       final AccessToken accessToken = result.accessToken!;

//       // 3. إنشاء بيانات اعتماد لـ Firebase باستخدام توكن فيسبوك
//       final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

//       // 4. تسجيل الدخول في Firebase
//       await _auth.signInWithCredential(credential);

//       Get.back(); // إغلاق شاشة التحميل
//       Get.snackbar('نجاح', 'تم تسجيل الدخول بواسطة فيسبوك بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
      
//       // الانتقال للوحة التحكم
//       Get.offAllNamed(Routes.dashbordscreen);
//     } else {
//       Get.back();
//       Get.snackbar('خطأ', 'فشل تسجيل الدخول: ${result.message}', backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   } catch (e) {
//     Get.back();
//     Get.snackbar('خطأ', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
//     print("Facebook Sign-In Error: $e");
//   }
// }

@override
void onClose () {
emailcontroller.dispose() ;
passwordcontroller.dispose();
super.onClose();

}


}