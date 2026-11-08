// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:taskflow_flutter/routes/app_routes.dart';
import 'package:taskflow_flutter/views/screens/settings_screen.dart';
// import 'package:taskflow_flutter/views/screens/auth/login.dart';
class DashbordController extends GetxController {

RxInt selectedIndex = 0.obs;


final  screens = [
  () => Settingsscreen(),
  () => Settingsscreen(),
  () => Settingsscreen(),
  () => Settingsscreen(),
    () => Settingsscreen(),
  

// await FirebaseAuth.instance.signOut();




];

void onItemTapped(int index) {
  selectedIndex.value = index; 
  
  }



} 