import 'package:get/get.dart';

class MyMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_EG': {
          'welcome': 'مهندسي العزيز، أهلاً بك',
          'change_lang': 'تغيير إلى الإنجليزية',
          'TaskFlow' : "تاسك فلو"
        },
        'en_US': {
          'welcome': 'Welcome, dear engineer',
          'change_lang': 'Switch to Arabic',
          'TaskFlow' : 'TaskFlow'
        },
      };
}