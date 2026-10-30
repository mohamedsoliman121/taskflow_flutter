

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/routes/app_routes.dart';

class WelcameController extends GetxController {
var currentIndex = 0.obs;
final PageController pageController = PageController();

  // دالة لتحديث الصفحة الحالية
  void changePage(int index) {
    currentIndex.value = index;
  }

  void gotologin () {
    Get.toNamed(Routes.loginscreen) ;
  
  }
  void gotoSignup () {
    Get.toNamed(Routes.signupscreen) ;
  
  }
  void startAutoSlide() {
  Future.delayed(const Duration(seconds: 4), () {
    if (isClosed) return;

    if (currentIndex.value == 0) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  });
}

  @override
  void onInit() {
    super.onInit();
startAutoSlide();

    }

      @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
    // ممكن هنا نعمل Timer لو حابب الصفحات تقلب لو وحدها تلقائياً
  }


  
