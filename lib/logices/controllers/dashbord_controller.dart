import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/views/screens/auth/login.dart';
class DashbordController extends GetxController {

var selectedIndex = 0.obs;


final List<Widget> screens = [
  Center(child: Text('Home Screen')),
  Center(child: Text('Search Screen')),
  Center(child: Text('Settings Screen')),
  Center(child: Text('Settings Screen')),
  Center(child: Text('Profile Screen')),

];

void onItemTapped(int index) {
  selectedIndex.value = index; 
  
  }



} 