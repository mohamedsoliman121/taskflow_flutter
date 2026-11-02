import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';
class DashbordController extends GetxController {

var selectedIndex = 0.obs;


final List<Widget> screens = [
  Center(child: Text('Home Screen')),
  Center(child: Text('Search Screen')),
  Center(child: Text('Settings Screen')),
  Center(child: Text('Profile Screen')),
  Center(child: TextButton(onPressed: ()  async {

await FirebaseAuth.instance.signOut();
Get.snackbar(" تسجيل الخروج ", " تم تسجيل الخروج بنجاح");
Get.offAllNamed(Routes.welcamescreen );

    
  }, child: Text('نقطة الخروج'))),

];

void onItemTapped(int index) {
  selectedIndex.value = index; 
  
  }



} 