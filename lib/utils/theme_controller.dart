import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // قراءة الحالة المخزنة مسبقاً (افتراضياً الوضع الفاتح false)
  bool get _loadTheme => _box.read(_key) ?? false;

  // إرجاع الثيم الحالي بناءً على الحالة
  ThemeMode get theme => _loadTheme ? ThemeMode.dark : ThemeMode.light;

  // دالة تبديل الثيم وحفظه في الذاكرة
  void switchTheme() {
    Get.changeThemeMode(_loadTheme ? ThemeMode.light : ThemeMode.dark);
    _box.write(_key, !_loadTheme);
    update();
  }
}