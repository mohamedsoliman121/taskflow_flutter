import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLocaleController extends GetxController {
  final _box = GetStorage();
  final _key = 'lang';

  // دالة لتحديد اللغة الافتراضية عند فتح التطبيق لأول مرة
  Locale get initialLocale {
    String? savedLang = _box.read(_key);
    if (savedLang == null) {
      // إذا لم يختار المستخدم من قبل، نأخذ لغة الجهاز أو نحدد العربية افتراضياً
      return Locale('ar', 'EG');
    }
    // إذا وجدنا لغة مخزنة، نقوم بتقسيمها (مثل ar_EG إلى لغة ودولة)
    List<String> langParts = savedLang.split('_');
    return Locale(langParts[0], langParts.length > 1 ? langParts[1] : null);
  }

  // دالة تغيير اللغة وحفظها
  void changeLanguage(String langCode, String countryCode) {
    Locale locale = Locale(langCode, countryCode);
    Get.updateLocale(locale); // تغيير لغة التطبيق لحظياً
    _box.write(_key, '${langCode}_${countryCode}'); // حفظ الاختيار محلياً
    update();
  }
}